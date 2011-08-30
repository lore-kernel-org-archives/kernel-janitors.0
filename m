From: "Nandigama, Nagalakshmi" <Nagalakshmi.Nandigama@lsi.com>
Date: Tue, 30 Aug 2011 10:54:31 +0000
Subject: RE: [PATCH] drivers/scsi/mpt2sas/mpt2sas_transport.c: add missing
Message-Id: <A6888A6805518E4EA4AF7072A28264A6042AD54391@inbmail02.lsi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312975933-18277-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312975933-18277-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Desai, Kashyap" <Kashyap.Desai@lsi.com>, James Bottomley <James.Bottomley@suse.de>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

The patch seem to be fine. Please consider this patch as Acked-by: "Nandigama, Nagalakshmi" <Nagalakshmi.Nandigama@lsi.com>

Regards,
Nagalakshmi


-----Original Message-----
From: Julia Lawall [mailto:julia@diku.dk] 
Sent: Wednesday, August 10, 2011 5:02 PM
To: James E.J. Bottomley
Cc: kernel-janitors@vger.kernel.org; Desai, Kashyap; James Bottomley; linux-scsi@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/scsi/mpt2sas/mpt2sas_transport.c: add missing sas_phy_free

From: Julia Lawall <julia@diku.dk>

In each case, sas_phy_add has not yet been successfully applied, so use
sas_phy_free to free phy.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/mpt2sas/mpt2sas_transport.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/mpt2sas/mpt2sas_transport.c b/drivers/scsi/mpt2sas/mpt2sas_transport.c
index 15c7980..762f05e 100644
--- a/drivers/scsi/mpt2sas/mpt2sas_transport.c
+++ b/drivers/scsi/mpt2sas/mpt2sas_transport.c
@@ -857,6 +857,7 @@ mpt2sas_transport_add_host_phy(struct MPT2SAS_ADAPTER *ioc, struct _sas_phy
 	    &mpt2sas_phy->identify))) {
 		printk(MPT2SAS_ERR_FMT "failure at %s:%d/%s()!\n",
 		    ioc->name, __FILE__, __LINE__, __func__);
+		sas_phy_free(phy);
 		return -1;
 	}
 	phy->identify = mpt2sas_phy->identify;
@@ -923,6 +924,7 @@ mpt2sas_transport_add_expander_phy(struct MPT2SAS_ADAPTER *ioc, struct _sas_phy
 	    &mpt2sas_phy->identify))) {
 		printk(MPT2SAS_ERR_FMT "failure at %s:%d/%s()!\n",
 		    ioc->name, __FILE__, __LINE__, __func__);
+		sas_phy_free(phy);
 		return -1;
 	}
 	phy->identify = mpt2sas_phy->identify;

