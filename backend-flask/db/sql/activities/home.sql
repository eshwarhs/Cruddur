SELECT
  activities.uuid,
  users.display_name,
  users.cognito_user_id as cognito_user_uuid,
  users.handle,
  activities.message,
  activities.replies_count,
  activities.reposts_count,
  activities.likes_count,
  activities.expires_at,
  activities.created_at,
  (SELECT COALESCE(array_to_json(array_agg(row_to_json(array_row))),'[]'::json) FROM (
  SELECT
    replies.uuid,
    reply_users.display_name,
    reply_users.handle,
    replies.message,
    replies.replies_count,
    replies.reposts_count,
    replies.likes_count,
    replies.reply_to_activity_uuid,
    replies.created_at,
    reply_users.cognito_user_id as cognito_user_uuid
  FROM public.activities replies
  LEFT JOIN public.users reply_users ON reply_users.uuid = replies.user_uuid
  WHERE
    replies.reply_to_activity_uuid = activities.uuid
  ORDER BY  activities.created_at ASC
  ) array_row) as replies
FROM public.activities
LEFT JOIN public.users ON users.uuid = activities.user_uuid
WHERE activities.expires_at > now() AND activities.reply_to_activity_uuid IS NULL
ORDER BY activities.created_at DESC