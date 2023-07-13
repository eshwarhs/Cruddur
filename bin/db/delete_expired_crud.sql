DELETE from
  public.activities
WHERE
  activities.expires_at < now();