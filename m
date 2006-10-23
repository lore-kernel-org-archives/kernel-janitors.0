From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:19:10 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/message
Message-Id: <1161634750.419.11.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/message/fusion/mptbase.c.orig	2006-10-23 21:22:37.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/message/fusion/mptbase.c	2006-10-23 21:23:14.000000000 +0200
@@ -4846,9 +4846,8 @@ mpt_read_ioc_pg_3(MPT_ADAPTER *ioc)
 	cfg.physAddr = ioc3_dma;
 	cfg.action = MPI_CONFIG_ACTION_PAGE_READ_CURRENT;
 	if (mpt_config(ioc, &cfg) = 0) {
-		mem = kmalloc(iocpage3sz, GFP_ATOMIC);
+		mem = kmemdup((u8 *) pIoc3, iocpage3sz, GFP_ATOMIC);
 		if (mem) {
-			memcpy(mem, (u8 *)pIoc3, iocpage3sz);
 			ioc->raid_data.pIocPg3 = (IOCPage3_t *) mem;
 		}
 	}


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
