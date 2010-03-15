From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:23:32 +0000
Subject: [patch] infiniband:  remove dead code
Message-Id: <20100315082332.GF18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Or Gerlitz <ogerlitz-smomgflXvOZWk0Htik3J/w@public.gmane.org>, Thadeu Lima de Souza Cascardo <cascardo-DmMZpsCg3uxeGPcbtGPokg@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"ret" is initialized to -ENOMEM so we don't need to set it here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/infiniband/ulp/iser/iser_verbs.c b/drivers/infiniband/ulp/iser/iser_verbs.c
index 308d17b..8fa6997 100644
--- a/drivers/infiniband/ulp/iser/iser_verbs.c
+++ b/drivers/infiniband/ulp/iser/iser_verbs.c
@@ -148,10 +148,8 @@ static int iser_create_ib_conn_res(struct iser_conn *ib_conn)
 	device = ib_conn->device;
 
 	ib_conn->login_buf = kmalloc(ISER_RX_LOGIN_SIZE, GFP_KERNEL);
-	if (!ib_conn->login_buf) {
+	if (!ib_conn->login_buf)
 		goto alloc_err;
-		ret = -ENOMEM;
-	}
 
 	ib_conn->login_dma = ib_dma_map_single(ib_conn->device->ib_device,
 				(void *)ib_conn->login_buf, ISER_RX_LOGIN_SIZE,
@@ -160,10 +158,9 @@ static int iser_create_ib_conn_res(struct iser_conn *ib_conn)
 	ib_conn->page_vec = kmalloc(sizeof(struct iser_page_vec) +
 				    (sizeof(u64) * (ISCSI_ISER_SG_TABLESIZE +1)),
 				    GFP_KERNEL);
-	if (!ib_conn->page_vec) {
-		ret = -ENOMEM;
+	if (!ib_conn->page_vec)
 		goto alloc_err;
-	}
+
 	ib_conn->page_vec->pages = (u64 *) (ib_conn->page_vec + 1);
 
 	params.page_shift        = SHIFT_4K;
