From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 07:06:10 +0000
Subject: [patch] brcmfmac: uninitialized "ret" variable
Message-Id: <20160315070610.GC13560@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Fu, Zhonghui" <zhonghui.fu@linux.intel.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

There is an error path where "ret" isn't initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index da0cdd3..2fc0597 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -250,7 +250,7 @@ static int brcmf_sdiod_request_data(struct brcmf_sdio_dev *sdiodev, u8 fn,
 				    u32 addr, u8 regsz, void *data, bool write)
 {
 	struct sdio_func *func;
-	int ret;
+	int ret = -EINVAL;
 
 	brcmf_dbg(SDIO, "rw=%d, func=%d, addr=0x%05x, nbytes=%d\n",
 		  write, fn, addr, regsz);
