From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Sep 2015 20:43:27 +0000
Subject: re: perf/x86/intel: Fix LBR callstack issue caused by FREEZE_LBRS_ON_PMI
Message-Id: <20150914204327.GA11902@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Kan Liang,

This is a semi-automatic email about new static checker warnings.

The patch deb27519bf1f: "perf/x86/intel: Fix LBR callstack issue 
caused by FREEZE_LBRS_ON_PMI" from Aug 17, 2015, leads to the 
following Smatch complaint:

arch/x86/kernel/cpu/perf_event_intel_lbr.c:155 __intel_pmu_lbr_enable()
	 warn: variable dereferenced before check 'cpuc->lbr_sel' (see line 154)

arch/x86/kernel/cpu/perf_event_intel_lbr.c
   153		 */
   154		lbr_select = cpuc->lbr_sel->config;
                             ^^^^^^^^^^^^^^^^^^^^^
New unchecked dereference.

   155		if (cpuc->lbr_sel && !pmi)
                    ^^^^^^^^^^^^^
Old code assumes it can be NULL.

   156			wrmsrl(MSR_LBR_SELECT, lbr_select);
   157	

regards,
dan carpenter
