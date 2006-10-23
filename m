From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:17:21 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/infiniband
Message-Id: <1161634641.419.7.camel@alice>
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

--- linux-2.6.19-rc2-git7/drivers/infiniband/core/cm.c.orig	2006-10-23 21:07:38.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/infiniband/core/cm.c	2006-10-23 21:08:07.000000000 +0200
@@ -240,11 +240,10 @@ static void * cm_copy_private_data(const
 	if (!private_data || !private_data_len)
 		return NULL;
 
-	data = kmalloc(private_data_len, GFP_KERNEL);
+	data = kmemdup(private_data, private_data_len, GFP_KERNEL);
 	if (!data)
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(data, private_data, private_data_len);
 	return data;
 }
 
--- linux-2.6.19-rc2-git7/drivers/infiniband/core/ucm.c.orig	2006-10-23 21:08:16.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/infiniband/core/ucm.c	2006-10-23 21:08:58.000000000 +0200
@@ -328,20 +328,18 @@ static int ib_ucm_event_process(struct i
 	}
 
 	if (uvt->data_len) {
-		uvt->data = kmalloc(uvt->data_len, GFP_KERNEL);
+		uvt->data = kmemdup(evt->private_data, uvt->data_len, GFP_KERNEL);
 		if (!uvt->data)
 			goto err1;
 
-		memcpy(uvt->data, evt->private_data, uvt->data_len);
 		uvt->resp.present |= IB_UCM_PRES_DATA;
 	}
 
 	if (uvt->info_len) {
-		uvt->info = kmalloc(uvt->info_len, GFP_KERNEL);
+		uvt->info = kmemdup(info, uvt->info_len, GFP_KERNEL);
 		if (!uvt->info)
 			goto err2;
 
-		memcpy(uvt->info, info, uvt->info_len);
 		uvt->resp.present |= IB_UCM_PRES_INFO;
 	}
 	return 0;
--- linux-2.6.19-rc2-git7/drivers/infiniband/core/iwcm.c.orig	2006-10-23 21:09:11.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/infiniband/core/iwcm.c	2006-10-23 21:09:32.000000000 +0200
@@ -140,10 +140,9 @@ static int copy_private_data(struct iwcm
 {
 	void *p;
 
-	p = kmalloc(event->private_data_len, GFP_ATOMIC);
+	p = kmemdup(event->private_data, event->private_data_len, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
-	memcpy(p, event->private_data, event->private_data_len);
 	event->private_data = p;
 	return 0;
 }
--- linux-2.6.19-rc2-git7/drivers/infiniband/hw/mthca/mthca_provider.c.orig	2006-10-23 21:09:57.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/infiniband/hw/mthca/mthca_provider.c	2006-10-23 21:10:28.000000000 +0200
@@ -1100,11 +1100,10 @@ static struct ib_fmr *mthca_alloc_fmr(st
 	struct mthca_fmr *fmr;
 	int err;
 
-	fmr = kmalloc(sizeof *fmr, GFP_KERNEL);
+	fmr = kmemdup(fmr_attr, sizeof *fmr, GFP_KERNEL);
 	if (!fmr)
 		return ERR_PTR(-ENOMEM);
 
-	memcpy(&fmr->attr, fmr_attr, sizeof *fmr_attr);
 	err = mthca_fmr_alloc(to_mdev(pd->device), to_mpd(pd)->pd_num,
 			     convert_access(mr_access_flags), fmr);
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
