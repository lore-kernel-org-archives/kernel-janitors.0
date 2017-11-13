From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Nov 2017 11:46:21 +0000
Subject: [bug report] perf report: Add dump_read function
Message-Id: <20171113114621.zpjw4tj5iewxv4mi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Olsa,

This is a semi-automatic email about new static checker warnings.

The patch dac7f6b7ed1c: "perf report: Add dump_read function" from 
Aug 24, 2017, leads to the following Smatch complaint:

    ./tools/perf/util/session.c:1148 dump_read()
     error: we previously assumed 'evsel' could be null (see line 1145)

./tools/perf/util/session.c
  1144		printf(": %d %d %s %" PRIu64 "\n", event->read.pid, event->read.tid,
  1145		       evsel ? perf_evsel__name(evsel) : "FAIL",
                       ^^^^^
The patch adds a check for NULL

  1146		       event->read.value);
  1147	
  1148		read_format = evsel->attr.read_format;
                              ^^^^^^^
followed by an unchecked dereference.

  1149	
  1150		if (read_format & PERF_FORMAT_TOTAL_TIME_ENABLED)

regards,
dan carpenter
