From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Fri, 06 Apr 2018 04:57:20 +0000
Subject: [PATCH] staging: ks7010: replace kmalloc() + memcpy() with kmemdup()
Message-Id: <1522990640-30706-1-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180406045742epcas1p22ad1bad680b9526a81c7371b75ac1f1e@epcas1p2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: me@tobin.cc, sergio.paracuellos@gmail.com, quytelda@tamalin.org, dan.carpenter@oracle.com, y.k.oh@samsung.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ji-Hun Kim <ji_hun.kim@samsung.com>

Use kmemdup rather than duplicating its implementation.

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index b8f55a1..c8eb55b 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -589,11 +589,10 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 	int ret;
 	unsigned char *data_buf;
 
-	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
+	data_buf = kmemdup(&index, sizeof(u32), GFP_KERNEL);
 	if (!data_buf)
 		return -ENOMEM;
 
-	memcpy(data_buf, &index, sizeof(index));
 	ret = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
 	if (ret)
 		goto err_free_data_buf;
-- 
1.9.1

