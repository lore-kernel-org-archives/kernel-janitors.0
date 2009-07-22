From: Nicolas Palix <npalix@diku.dk>
Date: Wed, 22 Jul 2009 13:39:13 +0000
Subject: [PATCH] Transform some kzalloc calls to kcalloc in staging/hv
Message-Id: <200907221539.13589.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, haiyangz@microsoft.com, hjanssen@microsoft.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Julia Lawall <julia@diku.dk>


Here is a short excerpt of the semantic patch performing
this transformation:
(http://www.emn.fr/x-info/coccinelle/)

//<smpl>
@@
expression E1,E2,E3;
@@
- kzalloc(E1*sizeof(E2),E3)
+ kcalloc(E1,sizeof(E2),E3)

@@
expression E1,E3;
type T;
@@
- kzalloc(E1*sizeof(T),E3)
+ kcalloc(E1,sizeof(T),E3)
//</smpl>

Signed-off-by: Nicolas Palix <npalix@diku.dk>
---
 drivers/staging/hv/storvsc_drv.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/hv/storvsc_drv.c b/drivers/staging/hv/storvsc_drv.c
index c080beb..830076b 100644
--- a/drivers/staging/hv/storvsc_drv.c
+++ b/drivers/staging/hv/storvsc_drv.c
@@ -473,7 +473,7 @@ static struct scatterlist *create_bounce_buffer(struct scatterlist *sgl, unsigne
 
 	num_pages = ALIGN_UP(len, PAGE_SIZE) >> PAGE_SHIFT;
 
-	bounce_sgl = kzalloc(num_pages * sizeof(struct scatterlist), GFP_ATOMIC);
+	bounce_sgl = kcalloc(num_pages, sizeof(struct scatterlist), GFP_ATOMIC);
 	if (!bounce_sgl)
 	{
 		return NULL;
@@ -928,14 +928,14 @@ static void storvsc_host_rescan_callback(struct work_struct *work)
 	DPRINT_ENTER(STORVSC_DRV);
 
 	host_device_ctx = (struct host_device_context*)host->hostdata;
-	lun_list = kzalloc(sizeof(unsigned int)*STORVSC_MAX_LUNS_PER_TARGET, GFP_ATOMIC);
+	lun_list = kcalloc(STORVSC_MAX_LUNS_PER_TARGET, sizeof(unsigned int), GFP_ATOMIC);
 	if (!lun_list)
 	{
 		DPRINT_ERR(STORVSC_DRV, "unable to allocate lun list");
 		return;
 	}
 
-	sdevs_remove_list = kzalloc(sizeof(void*)*STORVSC_MAX_LUNS_PER_TARGET, GFP_ATOMIC);
+	sdevs_remove_list = kcalloc(STORVSC_MAX_LUNS_PER_TARGET, sizeof(void *), GFP_ATOMIC);
 	if (!sdevs_remove_list)
 	{
 		kfree(lun_list);
-- 
1.6.0.4


-- 
Nicolas Palix
