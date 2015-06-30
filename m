From: Sohny Thomas <sohnythomas@zoho.com>
Date: Tue, 30 Jun 2015 21:47:45 +0000
Subject: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <55930BB1.10502@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org
Cc: gregkh@linuxfoundation.org, sparmaintainer@unisys.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


FIX 2 unnecessary braces found by checkpatch.pl

Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
---
 drivers/staging/unisys/virtpci/virtpci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/unisys/virtpci/virtpci.c b/drivers/staging/unisys/virtpci/virtpci.c
index d5ad017..f3674de 100644
--- a/drivers/staging/unisys/virtpci/virtpci.c
+++ b/drivers/staging/unisys/virtpci/virtpci.c
@@ -190,9 +190,10 @@ static int write_vbus_chp_info(struct spar_vbus_channel_protocol *chan,
 		return -1;
 
 	off = sizeof(struct channel_header) + chan->hdr_info.chp_info_offset;
-	if (chan->hdr_info.chp_info_offset = 0) {
+
+	if (chan->hdr_info.chp_info_offset = 0)
 		return -1;
-	}
+
 	memcpy(((u8 *)(chan)) + off, info, sizeof(*info));
 	return 0;
 }
@@ -484,10 +485,10 @@ static int delete_vhba(struct del_virt_guestpart *delparams)
 
 	i = virtpci_device_del(NULL /*no parent bus */, VIRTHBA_TYPE,
 			       &scsi.wwnn, NULL);
-	if (i) {
+	if (i)
 		return 1;
-	}
-	return 0;
+	else
+		return 0;
 }
 
 /* deletes a vnic
-- 

