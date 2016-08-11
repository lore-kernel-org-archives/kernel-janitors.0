From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:23:25 +0000
Subject: [PATCH v2 01/10] staging: ks7010: Delete unnecessary checks before the function call "kfree"
Message-Id: <2dc9e2f0-6ed8-0a2d-4d41-c00116d48119@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
In-Reply-To: <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Aug 2016 17:15:15 +0200

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index b7337fd..7da6c84 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -732,8 +732,7 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 		goto error_out;
 	}
  error_out:
-	if (data_buf)
-		kfree(data_buf);
+	kfree(data_buf);
 	return rc;
 }
 
@@ -763,8 +762,7 @@ static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 		goto error_out;
 	}
  error_out:
-	if (read_buf)
-		kfree(read_buf);
+	kfree(read_buf);
 	return rc;
 }
 
@@ -879,8 +877,7 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 	release_firmware(fw_entry);
  error_out0:
 	sdio_release_host(card->func);
-	if (rom_buf)
-		kfree(rom_buf);
+	kfree(rom_buf);
 	return rc;
 }
 
@@ -1199,9 +1196,7 @@ static void ks7010_sdio_remove(struct sdio_func *func)
 		unregister_netdev(netdev);
 
 		trx_device_exit(priv);
-		if (priv->ks_wlan_hw.read_buf) {
-			kfree(priv->ks_wlan_hw.read_buf);
-		}
+		kfree(priv->ks_wlan_hw.read_buf);
 		free_netdev(priv->net_dev);
 		card->priv = NULL;
 	}
-- 
2.9.2

