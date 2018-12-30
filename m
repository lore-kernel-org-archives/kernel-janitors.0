From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Dec 2018 15:53:12 +0000
Subject: [PATCH 5/8] staging: rtl8192e: reduce indentation
Message-Id: <1546185195-25676-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Delete tab aligning a statement with the right hand side of a
preceding assignment rather than the left hand side.

Found with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 843e874b8a06..b798cde0ce47 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -1049,9 +1049,9 @@ static int _rtl92e_wx_set_promisc_mode(struct net_device *dev,
 					(bPromiscuousOn) ? (true) : (false);
 		ieee->IntelPromiscuousModeInfo.bFilterSourceStationFrame  			(bFilterSourceStationFrame) ? (true) : (false);
-			(bPromiscuousOn) ?
-			(rtllib_EnableIntelPromiscuousMode(dev, false)) :
-			(rtllib_DisableIntelPromiscuousMode(dev, false));
+		(bPromiscuousOn) ?
+		(rtllib_EnableIntelPromiscuousMode(dev, false)) :
+		(rtllib_DisableIntelPromiscuousMode(dev, false));
 
 		netdev_info(dev,
 			    "====>%s(), on = %d, filter src sta = %d\n",
