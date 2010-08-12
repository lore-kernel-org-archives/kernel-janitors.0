From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:52:36 +0000
Subject: [patch 2/2] ip2: return -EFAULT on copy_to_user errors
Message-Id: <20100812075236.GM645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael H. Warfield" <mhw@wittsend.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Rakib Mullick <rakib.mullick@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining but we want to
return a negative error code on errors.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 8fa041e..d4b71e8 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -2930,6 +2930,8 @@ ip2_ipl_ioctl (struct file *pFile, UINT cmd, ULONG arg )
 				if ( pCh )
 				{
 					rc = copy_to_user(argp, pCh, sizeof(i2ChanStr));
+					if (rc)
+						rc = -EFAULT;
 				} else {
 					rc = -ENODEV;
 				}
