From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Nov 2011 06:43:46 +0000
Subject: [patch] isdn: avoid copying too long drvid
Message-Id: <20111123064345.GB6871@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"cfg->drvid" comes from the user so there is a possibility they
didn't NUL terminate properly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/i4l/isdn_net.c b/drivers/isdn/i4l/isdn_net.c
index 1f73d7f..487d214 100644
--- a/drivers/isdn/i4l/isdn_net.c
+++ b/drivers/isdn/i4l/isdn_net.c
@@ -2756,6 +2756,8 @@ isdn_net_setcfg(isdn_net_ioctl_cfg * cfg)
 			char *c,
 			*e;
 
+			if (strlen(cfg->drvid) >= sizeof(drvid))
+				return -EINVAL;
 			drvidx = -1;
 			chidx = -1;
 			strcpy(drvid, cfg->drvid);
