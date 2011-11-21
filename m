From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Nov 2011 14:47:13 +0000
Subject: [patch] prism54: potential memory corruption in prism54_get_essid()
Message-Id: <20111121144713.GA19092@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"dwrq->length" is the capped version of "essid->length".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
index d97a2ca..bc2ba80 100644
--- a/drivers/net/wireless/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/prism54/isl_ioctl.c
@@ -778,7 +778,7 @@ prism54_get_essid(struct net_device *ndev, struct iw_request_info *info,
 		dwrq->flags = 0;
 		dwrq->length = 0;
 	}
-	essid->octets[essid->length] = '\0';
+	essid->octets[dwrq->length] = '\0';
 	memcpy(extra, essid->octets, dwrq->length);
 	kfree(essid);
 
