From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Jul 2014 09:37:31 +0000
Subject: re: perf/hwpb: Invoke __perf_event_disable() if interrupts are already disabled
Message-Id: <20140707093731.GA32260@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello K.Prasad,

This is a semi-automatic email about new static checker warnings.

The patch 500ad2d8b013: "perf/hwpb: Invoke __perf_event_disable() if
interrupts are already disabled" from Aug 2, 2012, leads to the
following Smatch complaint:

kernel/events/hw_breakpoint.c:449 modify_user_hw_breakpoint()
	 error: we previously assumed 'bp->ctx' could be null (see line 446)

kernel/events/hw_breakpoint.c
   445		 */
   446		if (irqs_disabled() && bp->ctx && bp->ctx->task = current)
                                       ^^^^^^^
We add a new assumption that bp->ctx can be NULL in this patch.

   447			__perf_event_disable(bp);
   448		else
   449			perf_event_disable(bp);
                        ^^^^^^^^^^^^^^^^^^^^^^
But it is dereferenced unconditionally in perf_event_disable().

   450	
   451		bp->attr.bp_addr = attr->bp_addr;

regards,
dan carpenter
