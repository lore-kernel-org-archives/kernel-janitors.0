From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Jun 2013 06:20:08 +0000
Subject: [patch] xen-netback: double free on unload
Message-Id: <20130621062008.GA10873@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Campbell <ian.campbell@citrix.com>
Cc: xen-devel@lists.xensource.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here, "i" vs "j", so we would crash on module_exit().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index a0b50ad..130bcb2 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1968,8 +1968,8 @@ static void __exit netback_fini(void)
 		del_timer_sync(&netbk->net_timer);
 		kthread_stop(netbk->task);
 		for (j = 0; j < MAX_PENDING_REQS; j++) {
-			if (netbk->mmap_pages[i])
-				__free_page(netbk->mmap_pages[i]);
+			if (netbk->mmap_pages[j])
+				__free_page(netbk->mmap_pages[j]);
 		}
 	}
 
