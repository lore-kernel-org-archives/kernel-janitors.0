From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 10:06:58 +0000
Subject: [PATCH 6/9] be2iscsi: constify pci_error_handlers structures
Message-Id: <1447495621-9161-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jayamohan Kallickal <jayamohan.kallickal@avagotech.com>
Cc: kernel-janitors@vger.kernel.org, Ketan Mukadam <ketan.mukadam@avagotech.com>, John Soni Jose <sony.john@avagotech.com>, "James E.J. Bottomley" <JBottomley@odin.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

This pci_error_handlers structure is never modified, like all the other
pci_error_handlers structures, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
There are no dependencies between these patches.

 drivers/scsi/be2iscsi/be_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index 2e6abe7..0b8f873 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5786,7 +5786,7 @@ disable_pci:
 	return ret;
 }
 
-static struct pci_error_handlers beiscsi_eeh_handlers = {
+static const struct pci_error_handlers beiscsi_eeh_handlers = {
 	.error_detected = beiscsi_eeh_err_detected,
 	.slot_reset = beiscsi_eeh_reset,
 	.resume = beiscsi_eeh_resume,

