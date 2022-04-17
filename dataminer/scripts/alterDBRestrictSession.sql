-- restrict new sessions to just sys type accounts
-- Necessary to run before removing or migrating ODMR Repository
alter system enable restricted session;