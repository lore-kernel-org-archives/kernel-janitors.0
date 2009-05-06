From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 06 May 2009 22:23:44 +0000
Subject: [PATCH] RAMDISK:  Remove long-deprecated "ramdisk=" boot-time
Message-Id: <alpine.LFD.2.00.0905061821260.26544@localhost.lan>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


The "ramdisk" parameter was removed from the defunct rd.c file quite
some time ago, in favour of the more specific "ramdisk_size"
parameter so, for consistency, the same should be done here.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  the earlier removal was in fac8b209b1084bc85748bd54e13d00c1262b220f.

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 5f7e64b..4bf8705 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -407,12 +407,7 @@ static int __init ramdisk_size(char *str)
 	rd_size = simple_strtol(str, NULL, 0);
 	return 1;
 }
-static int __init ramdisk_size2(char *str)
-{
-	return ramdisk_size(str);
-}
-__setup("ramdisk=", ramdisk_size);
-__setup("ramdisk_size=", ramdisk_size2);
+__setup("ramdisk_size=", ramdisk_size);
 #endif

 /*

====================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
====================================
