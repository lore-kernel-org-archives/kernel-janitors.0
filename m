From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 23 Dec 2015 20:42:57 +0000
Subject: [PATCH] staging: rdma: hfi1: diag: constify hfi1_filter_array structure
Message-Id: <1450903377-27803-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath@intel.com>
Cc: devel@driverdev.osuosl.org, linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

The hfi1_filter_array structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rdma/hfi1/diag.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rdma/hfi1/diag.c b/drivers/staging/rdma/hfi1/diag.c
index 0c88317..e41159f 100644
--- a/drivers/staging/rdma/hfi1/diag.c
+++ b/drivers/staging/rdma/hfi1/diag.c
@@ -257,7 +257,7 @@ static int hfi1_filter_ib_service_level(void *ibhdr, void *packet_data,
 static int hfi1_filter_ib_pkey(void *ibhdr, void *packet_data, void *value);
 static int hfi1_filter_direction(void *ibhdr, void *packet_data, void *value);
 
-static struct hfi1_filter_array hfi1_filters[] = {
+static const struct hfi1_filter_array hfi1_filters[] = {
 	{ hfi1_filter_lid },
 	{ hfi1_filter_dlid },
 	{ hfi1_filter_mad_mgmt_class },

