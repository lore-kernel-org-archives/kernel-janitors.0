From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 May 2016 10:38:27 +0000
Subject: re: perf/core: Introduce address range filtering
Message-Id: <20160510103827.GA28299@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexander Shishkin,

This is a semi-automatic email about new static checker warnings.

The patch 375637bc5249: "perf/core: Introduce address range 
filtering" from Apr 27, 2016, leads to the following Smatch complaint:

kernel/events/core.c:3865 _free_event()
	 warn: variable dereferenced before check 'event->pmu' (see line 3856)

kernel/events/core.c
  3855		perf_event_free_bpf_prog(event);
  3856		perf_addr_filters_splice(event, NULL);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
New code adds an unchecked "event->pmu" dereference inside function.

  3857		kfree(event->addr_filters_offs);
  3858	
  3859		if (event->destroy)
  3860			event->destroy(event);
  3861	
  3862		if (event->ctx)
  3863			put_ctx(event->ctx);
  3864	
  3865		if (event->pmu) {
                    ^^^^^^^^^^
Existing code assumes this can be NULL.

  3866			exclusive_event_destroy(event);
  3867			module_put(event->pmu->module);

regards,
dan carpenter
