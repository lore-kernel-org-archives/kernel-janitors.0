From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:10 +0000
Subject: [PATCH 1/18] USB: storage: ene_ub6250: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-2-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc: benoit.taine@lip6.fr, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Tested by compilation without errors.

 drivers/usb/storage/ene_ub6250.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 1bfc9a6..ef6efb5 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1928,11 +1928,10 @@ static int ene_load_bincode(struct us_data *us, unsigned char flag)
 		usb_stor_dbg(us, "load firmware %s failed\n", fw_name);
 		goto nofw;
 	}
-	buf = kmalloc(sd_fw->size, GFP_KERNEL);
+	buf = kmemdup(sd_fw->data, sd_fw->size, GFP_KERNEL);
 	if (buf = NULL)
 		goto nofw;
 
-	memcpy(buf, sd_fw->data, sd_fw->size);
 	memset(bcb, 0, sizeof(struct bulk_cb_wrap));
 	bcb->Signature = cpu_to_le32(US_BULK_CB_SIGN);
 	bcb->DataTransferLength = sd_fw->size;

