From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 21:21:31 +0000
Subject: [PATCH 3/3] RDMA/iwpm: Improve a size determination in two functions
Message-Id: <c3791ed7-b453-a76d-2f52-3e9d7f50d05e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b1df0889-b967-97ae-3a3d-0dde0d7258cd@users.sourceforge.net>
In-Reply-To: <b1df0889-b967-97ae-3a3d-0dde0d7258cd-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chien Tin Tung <chien.tin.tung-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Johannes Berg <johannes.berg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Shiraz Saleem <shiraz.saleem-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Tatyana Nikolova <tatyana.e.nikolova-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 22:05:54 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/core/iwpm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/iwpm_util.c b/drivers/infiniband/core/iwpm_util.c
index 9eb527074c32..902a2677df31 100644
--- a/drivers/infiniband/core/iwpm_util.c
+++ b/drivers/infiniband/core/iwpm_util.c
@@ -121,7 +121,8 @@ int iwpm_create_mapinfo(struct sockaddr_storage *local_sockaddr,
 
 	if (!iwpm_valid_client(nl_client))
 		return ret;
-	map_info = kzalloc(sizeof(struct iwpm_mapping_info), GFP_KERNEL);
+
+	map_info = kzalloc(sizeof(*map_info), GFP_KERNEL);
 	if (!map_info)
 		return -ENOMEM;
 
@@ -298,7 +299,7 @@ struct iwpm_nlmsg_request *iwpm_get_nlmsg_request(__u32 nlmsg_seq,
 	struct iwpm_nlmsg_request *nlmsg_request = NULL;
 	unsigned long flags;
 
-	nlmsg_request = kzalloc(sizeof(struct iwpm_nlmsg_request), gfp);
+	nlmsg_request = kzalloc(sizeof(*nlmsg_request), gfp);
 	if (!nlmsg_request)
 		return NULL;
 
-- 
2.16.1

