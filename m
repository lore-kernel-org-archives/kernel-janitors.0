From: Dan Carpenter <error27@gmail.com>
Date: Sat, 10 Jul 2010 08:53:38 +0000
Subject: [patch] prism54: call BUG_ON() earlier
Message-Id: <20100710085338.GQ19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This test is off by one because strlen() doesn't include the NULL
terminator.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
index 8d1190c..1051268 100644
--- a/drivers/net/wireless/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/prism54/isl_ioctl.c
@@ -2067,7 +2067,7 @@ send_simple_event(islpci_private *priv, const char *str)
 	memptr = kmalloc(IW_CUSTOM_MAX, GFP_KERNEL);
 	if (!memptr)
 		return;
-	BUG_ON(n > IW_CUSTOM_MAX);
+	BUG_ON(n >= IW_CUSTOM_MAX);
 	wrqu.data.pointer = memptr;
 	wrqu.data.length = n;
 	strcpy(memptr, str);
