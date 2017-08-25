From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 08:43:59 +0000
Subject: [PATCH] IB/usnic: check for allocation failure
Message-Id: <20170825083030.rga3kllp55xnr3jf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Benvenuti <benve-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Upinder Malhi <umalhi-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dave Goodell <dgoodell-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

usnic_uiom_get_dev_list() can return ERR_PTR(-ENOMEM) so we should check
for that.

Fixes: e3cf00d0a87f ("IB/usnic: Add Cisco VIC low-level hardware driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
index e5f57dd49980..e8523882e33b 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_verbs.c
@@ -164,6 +164,8 @@ find_free_vf_and_create_qp_grp(struct usnic_ib_dev *us_ibdev,
 	if (usnic_ib_share_vf) {
 		/* Try to find resouces on a used vf which is in pd */
 		dev_list = usnic_uiom_get_dev_list(pd->umem_pd);
+		if (IS_ERR(dev_list))
+			return ERR_CAST(dev_list);
 		for (i = 0; dev_list[i]; i++) {
 			dev = dev_list[i];
 			vf = pci_get_drvdata(to_pci_dev(dev));
