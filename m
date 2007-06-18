From: Shani Moideen <shani.moideen@wipro.com>
Date: Mon, 18 Jun 2007 03:45:56 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <1182137636.9020.17.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>) 
in drivers/infiniband/hw/ipath/ipath_driver.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/infiniband/hw/ipath/ipath_driver.c b/drivers/infiniband/hw/ipath/ipath_driver.c
index e3a2232..417e3ca 100644
--- a/drivers/infiniband/hw/ipath/ipath_driver.c
+++ b/drivers/infiniband/hw/ipath/ipath_driver.c
@@ -1509,7 +1509,7 @@ int ipath_create_rcvhdrq(struct ipath_devdata *dd,
 
 	/* clear for security and sanity on each use */
 	memset(pd->port_rcvhdrq, 0, pd->port_rcvhdrq_size);
-	memset(pd->port_rcvhdrtail_kvaddr, 0, PAGE_SIZE);
+	clear_page(pd->port_rcvhdrtail_kvaddr);
 
 	/*
 	 * tell chip each time we init it, even if we are re-using previous

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
