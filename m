From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 Aug 2013 09:52:31 +0000
Subject: [patch] Hostap: copying wrong data prism2_ioctl_giwaplist()
Message-Id: <20130809095231.GD29282@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jouni Malinen <j@w1.fi>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We want the data stored in "addr" and "qual", but the extra ampersands
mean we are copying stack data instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.  Should probably be applied to -stable
as well.

diff --git a/drivers/net/wireless/hostap/hostap_ioctl.c b/drivers/net/wireless/hostap/hostap_ioctl.c
index ac07473..e509030 100644
--- a/drivers/net/wireless/hostap/hostap_ioctl.c
+++ b/drivers/net/wireless/hostap/hostap_ioctl.c
@@ -523,9 +523,9 @@ static int prism2_ioctl_giwaplist(struct net_device *dev,
 
 	data->length = prism2_ap_get_sta_qual(local, addr, qual, IW_MAX_AP, 1);
 
-	memcpy(extra, &addr, sizeof(struct sockaddr) * data->length);
+	memcpy(extra, addr, sizeof(struct sockaddr) * data->length);
 	data->flags = 1; /* has quality information */
-	memcpy(extra + sizeof(struct sockaddr) * data->length, &qual,
+	memcpy(extra + sizeof(struct sockaddr) * data->length, qual,
 	       sizeof(struct iw_quality) * data->length);
 
 	kfree(addr);
