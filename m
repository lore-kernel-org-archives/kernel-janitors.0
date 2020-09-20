From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 20 Sep 2020 11:26:17 +0000
Subject: [PATCH 05/14] RDMA/efa: drop double zeroing
Message-Id: <1600601186-7420-6-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gal Pressman <galpress@amazon.com>
Cc: kernel-janitors@vger.kernel.org, Yossi Leybovich <sleybo@amazon.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org

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
  (n,sizeof(*x),flags)
...
sg_init_table(x,n)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/infiniband/hw/efa/efa_verbs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/infiniband/hw/efa/efa_verbs.c b/drivers/infiniband/hw/efa/efa_verbs.c
--- a/drivers/infiniband/hw/efa/efa_verbs.c
+++ b/drivers/infiniband/hw/efa/efa_verbs.c
@@ -1157,7 +1157,7 @@ static struct scatterlist *efa_vmalloc_b
 	struct page *pg;
 	int i;
 
-	sglist = kcalloc(page_cnt, sizeof(*sglist), GFP_KERNEL);
+	sglist = kmalloc_array(page_cnt, sizeof(*sglist), GFP_KERNEL);
 	if (!sglist)
 		return NULL;
 	sg_init_table(sglist, page_cnt);
