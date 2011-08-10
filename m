From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Aug 2011 11:32:13 +0000
Subject: [PATCH] drivers/scsi/mpt2sas/mpt2sas_transport.c: add missing sas_phy_free
Message-Id: <1312975933-18277-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: kernel-janitors@vger.kernel.org, Kashyap Desai <kashyap.desai@lsi.com>, James Bottomley <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

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

