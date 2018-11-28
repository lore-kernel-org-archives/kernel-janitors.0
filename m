From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Nov 2018 14:37:58 +0000
Subject: [bug report] perf script: Make itrace script default to all calls
Message-Id: <20181128143758.fpzxjcublfisup6s@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andi Kleen,

This is a semi-automatic email about new static checker warnings.

The patch 4eb068157121: "perf script: Make itrace script default to 
all calls" from Sep 20, 2018, leads to the following Smatch complaint:

    ./tools/perf/util/intel-pt.c:2579 intel_pt_process_auxtrace_info()
     error: we previously assumed 'session->itrace_synth_opts' could be null (see line 2575)

./tools/perf/util/intel-pt.c
  2574	
  2575		if (session->itrace_synth_opts && session->itrace_synth_opts->set) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
The old code assumed this could be NULL.

  2576			pt->synth_opts = *session->itrace_synth_opts;
  2577		} else {
  2578			itrace_synth_opts__set_default(&pt->synth_opts,
  2579					session->itrace_synth_opts->default_no_sample);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
But the patch adds an unchecked dereference.

  2580			if (use_browser != -1) {
  2581				pt->synth_opts.branches = false;

regards,
dan carpenter
