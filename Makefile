# the extensions name
EXTENSION     = quantile
DATA          = $(wildcard sql/*--*.sql)        # script files to install
TESTS         = $(wildcard test/sql/*.sql)      # use test/sql/*.sql as testfile

# find the sql and expected directories under test
# load plpgsql into test db
# load quantile extension into test db
REGRESS_OPTS  = --inputdir=test --load-extension=quantile --load-language=plpgsql
REGRESS       = $(patsubst test/sql/%.sql,%,$(TESTS))
OBJS          = $(patsubst %.c,%.o,$(wildcard src/*.c)) # object files
# final shared library to be build from multiple source files (OBJS)
MODULE_big    = $(EXTENSION)

# postgres build stuff
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
