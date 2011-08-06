From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 14:27:48 +0000
Subject: [patch] rtl8712: don't just return -EFAULT in wpa_supplicant_ioctl()
Message-Id: <20110806142748.GC10373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There were some curly braces missing so the original code in
wpa_supplicant_ioctl() pretty much always returned -EFAULT without
doing anything.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index 40e6b5c..c380a30 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -2072,9 +2072,10 @@ static int wpa_supplicant_ioctl(struct net_device *dev, struct iw_point *p)
 	param = (struct ieee_param *)_malloc(p->length);
 	if (param = NULL)
 		return -ENOMEM;
-	if (copy_from_user(param, p->pointer, p->length))
+	if (copy_from_user(param, p->pointer, p->length)) {
 		kfree((u8 *)param);
 		return -EFAULT;
+	}
 	switch (param->cmd) {
 	case IEEE_CMD_SET_WPA_PARAM:
 		ret = wpa_set_param(dev, param->u.wpa_param.name,
