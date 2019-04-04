From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 11:06:10 +0000
Subject: [bug report] perf script: Make itrace script default to all calls
Message-Id: <20190404110610.GA31435@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andi Kleen,

This is a semi-automatic email about new static checker warnings.

The patch 4eb068157121: "perf script: Make itrace script default to 
all calls" from Sep 20, 2018, leads to the following Smatch complaint:

    ./tools/perf/util/intel-pt.c:2595 intel_pt_process_auxtrace_info()
    warn: variable dereferenced before check 'session->itrace_synth_opts' (see line 2590)

./tools/perf/util/intel-pt.c
  2589			itrace_synth_opts__set_default(&pt->synth_opts,
  2590					session->itrace_synth_opts->default_no_sample);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The patch added a new dereference

  2591			if (use_browser != -1) {
  2592				pt->synth_opts.branches = false;
  2593				pt->synth_opts.callchain = true;
  2594			}
  2595			if (session->itrace_synth_opts)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
but the existing code checked for NULL.

  2596				pt->synth_opts.thread_stack   2597					session->itrace_synth_opts->thread_stack;

regards,
dan carpenter
