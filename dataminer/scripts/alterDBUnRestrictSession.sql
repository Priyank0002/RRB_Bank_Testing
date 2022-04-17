-- disable the restriction for new sessions to just sys type accounts
-- Run after removing or migrating ODMR Repository
alter system disable restricted session;