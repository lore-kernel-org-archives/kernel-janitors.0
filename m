From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:33:33 +0000
Subject: [patch 6/6] Staging: gdm72xx: remove duplicate condition
Message-Id: <20160222193333.GF23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Somya Anand <somyaanand214@gmail.com>, Shraddha Barke <shraddha.6596@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Wim de With <nauxuron@wimdewith.com>, Alison Schofield <amsfield22@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We know "len" is not zero because we tested for that at the beginning of
the function so this test can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/gdm_wimax.c b/drivers/staging/gdm72xx/gdm_wimax.c
index 6d647d6..09bf64e 100644
--- a/drivers/staging/gdm72xx/gdm_wimax.c
+++ b/drivers/staging/gdm72xx/gdm_wimax.c
@@ -667,9 +667,8 @@ static void gdm_wimax_transmit_pkt(struct net_device *dev, char *buf, int len)
 	cmd_len = be16_to_cpup((const __be16 *)&buf[2]);
 
 	if (len < cmd_len + HCI_HEADER_SIZE) {
-		if (len)
-			netdev_err(dev, "%s: invalid length [%d/%d]\n",
-				   __func__, cmd_len + HCI_HEADER_SIZE, len);
+		netdev_err(dev, "%s: invalid length [%d/%d]\n",
+			   __func__, cmd_len + HCI_HEADER_SIZE, len);
 		return;
 	}
 
