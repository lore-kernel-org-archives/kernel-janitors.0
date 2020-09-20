From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:25 +0000
Subject: [PATCH 13/14] misc: mic: drop double zeroing
Message-Id: <1600601186-7420-14-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: kernel-janitors@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

sg_init_table zeroes its first argument, so the allocation of that argument
doesn't have to.

the semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,n,flags;
@@

x = 
- kcalloc
+ kmalloc_array
  (n,sizeof(struct scatterlist),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/misc/mic/scif/scif_nodeqp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/misc/mic/scif/scif_nodeqp.c b/drivers/misc/mic/scif/scif_nodeqp.c
--- a/drivers/misc/mic/scif/scif_nodeqp.c
+++ b/drivers/misc/mic/scif/scif_nodeqp.c
@@ -363,7 +363,7 @@ scif_p2p_setsg(phys_addr_t pa, int page_
 	struct page *page;
 	int i;
 
-	sg = kcalloc(page_cnt, sizeof(struct scatterlist), GFP_KERNEL);
+	sg = kmalloc_array(page_cnt, sizeof(struct scatterlist), GFP_KERNEL);
 	if (!sg)
 		return NULL;
 	sg_init_table(sg, page_cnt);
