From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Oct 2013 12:28:38 +0000
Subject: [patch] yam: integer underflow in yam_ioctl()
Message-Id: <20131014121931.GI6247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Paul Roubelat <jpr@f6fbb.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We cap bitrate at YAM_MAXBITRATE in yam_ioctl(), but it could also be
negative.  I don't know the impact of using a negative bitrate but let's
prevent it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/yam.h b/include/linux/yam.h
index 7fe2822..512cdc2 100644
--- a/include/linux/yam.h
+++ b/include/linux/yam.h
@@ -77,6 +77,6 @@ struct yamdrv_ioctl_cfg {
 
 struct yamdrv_ioctl_mcs {
 	int cmd;
-	int bitrate;
+	unsigned int bitrate;
 	unsigned char bits[YAM_FPGA_SIZE];
 };
