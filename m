From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:25:01 +0000
Subject: [patch] [SCSI] mpt2sas: add missing allocation.
Message-Id: <20111104182501.GF5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Kashyap Desai <kashyap.desai@lsi.com>, James Bottomley <James.Bottomley@suse.de>, Nagalakshmi Nandigama <nagalakshmi.nandigama@lsi.com>, Eric Moore <eric.moore@lsi.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

There was supposed to be a kzalloc() here and the compiler complained
about it.
mpt2sas_scsih.c: In function ‘mpt2sas_scsih_reset_handler’:
mpt2sas_scsih.c:2807:21: warning: ‘fw_event’ may be used uninitialized in this function [-Wuninitialized]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mpt2sas/mpt2sas_scsih.c b/drivers/scsi/mpt2sas/mpt2sas_scsih.c
index 8889b1b..4e041f6 100644
--- a/drivers/scsi/mpt2sas/mpt2sas_scsih.c
+++ b/drivers/scsi/mpt2sas/mpt2sas_scsih.c
@@ -2802,6 +2802,11 @@ _scsih_error_recovery_delete_devices(struct MPT2SAS_ADAPTER *ioc)
 
 	if (ioc->is_driver_loading)
 		return;
+
+	fw_event = kzalloc(sizeof(struct fw_event_work), GFP_ATOMIC);
+	if (!fw_event)
+		return;
+
 	fw_event->event = MPT2SAS_REMOVE_UNRESPONDING_DEVICES;
 	fw_event->ioc = ioc;
 	_scsih_fw_event_add(ioc, fw_event);
