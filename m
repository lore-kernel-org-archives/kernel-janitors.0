From: Joe Perches <joe@perches.com>
Date: Sun, 19 Aug 2007 22:41:07 +0000
Subject: Re: [PATCH 4/5] Documentation/firmware/... convert #include
Message-Id: <1187563268.4200.162.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561972.4200.143.camel@localhost>
	 <20070819153422.1e0b54af.randy.dunlap@oracle.com>
	 <1187562717.4200.154.camel@localhost>
	 <20070819154146.337bf347.randy.dunlap@oracle.com>
In-Reply-To: <20070819154146.337bf347.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Markus Rechberger <markus.rechberger@amd.com>

On Sun, 2007-08-19 at 15:41 -0700, Randy Dunlap wrote:
> It's not only included in that directory.
> I find it included in 88 source files throughout the kernel tree.

I see, sorry.  I didn't read the file.
I thought it was a sample driver with a binary blob.

cheers,  Joe

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/Documentation/firmware_class/firmware_sample_driver.c b/Documentation/firmware_class/firmware_sample_driver.c
index 6865cbe..754ded2 100644
--- a/Documentation/firmware_class/firmware_sample_driver.c
+++ b/Documentation/firmware_class/firmware_sample_driver.c
@@ -13,7 +13,7 @@
 #include <linux/device.h>
 #include <linux/string.h>
 
-#include "linux/firmware.h"
+#include <linux/firmware.h>
 
 static struct device ghost_device = {
 	.bus_id    = "ghost0",



