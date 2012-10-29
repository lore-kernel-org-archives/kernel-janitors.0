From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Oct 2012 08:49:56 +0000
Subject: [patch] Input: wacom - fix a check for WACOM_24HDT
Message-Id: <20121029084956.GA7506@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jason Gerecke <killertofu@gmail.com>
Cc: Chris Bagwell <chris@cnpbagwell.com>, Ping Cheng <pingc@wacom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

The current condition is always true.  From the context, it looks like
we should be checking if ->type = WACOM_24HDT.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/tablet/wacom_sys.c b/drivers/input/tablet/wacom_sys.c
index 2c1e12b..858ad44 100644
--- a/drivers/input/tablet/wacom_sys.c
+++ b/drivers/input/tablet/wacom_sys.c
@@ -391,7 +391,7 @@ static int wacom_parse_hid(struct usb_interface *intf,
 							features->pktlen = WACOM_PKGLEN_TPC2FG;
 						}
 
-						if (features->type = MTSCREEN || WACOM_24HDT)
+						if (features->type = MTSCREEN || features->type = WACOM_24HDT)
 							features->pktlen = WACOM_PKGLEN_MTOUCH;
 
 						if (features->type = BAMBOO_PT) {
