From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:33:09 +0000
Subject: [patch 5/6] Staging: gdm72xx: underflow bug in gdm_wimax_ioctl_get_data()
Message-Id: <20160222193309.GE23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wim de With <nauxuron@wimdewith.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>

"size" here should be unsigned, otherwise we might end up trying to copy
negative bytes in gdm_wimax_ioctl_get_data() resulting in an information
leak.

Reported-by: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/wm_ioctl.h b/drivers/staging/gdm72xx/wm_ioctl.h
index 631cb1d..032cb07 100644
--- a/drivers/staging/gdm72xx/wm_ioctl.h
+++ b/drivers/staging/gdm72xx/wm_ioctl.h
@@ -74,12 +74,12 @@ struct fsm_s {
 };
 
 struct data_s {
-	int	size;
+	unsigned int size;
 	void	*buf;
 };
 
 struct udata_s {
-	int		size;
+	unsigned int	size;
 	void __user	*buf;
 };
 
