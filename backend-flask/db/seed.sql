-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Eshwar H S', 'eshwarhs99@gmail.com', 'eshwarhs' ,'MOCK'),
  ('Eshwar Hebbur', 'eshwar1011236@gmail.com', 'eshwarhebbur' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'eshwarhs' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )