INSERT INTO public.activities (
  user_uuid,
  message,
  reply_to_activity_uuid,
  expires_at
)
VALUES (
  (SELECT uuid 
    FROM public.users 
    WHERE users.cognito_user_id = %(cognito_user_id)s
    LIMIT 1
  ),
  %(message)s,
  %(reply_to_activity_uuid)s,
  (SELECT expires_At 
    FROM public.activities 
    WHERE activities.uuid = %(reply_to_activity_uuid)s
    LIMIT 1
  )
) RETURNING uuid;