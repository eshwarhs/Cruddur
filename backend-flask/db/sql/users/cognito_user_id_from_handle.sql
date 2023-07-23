SELECT
  users.cognito_user_id as cognito_user_uuid 
FROM public.users
WHERE 
  users.handle = %(handle)s
LIMIT 1