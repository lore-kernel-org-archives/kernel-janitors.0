From: Gustavo Franco <stratus@acm.org>
Date: Sat, 22 May 2004 21:54:57 +0000
Subject: [Kernel-janitors] [PATCH] request_region() on sound/oss/wavfront.c.
Message-Id: <40AFCC31.3050206@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi list,

[Patch aplied against 2.6.6-bk9 - compiles cleanly. ]

I've added two error checks for request_region() calls on the source
and replaced a check_region() with request_region().The release_region()
calls seems to be ok, but let me known if i'm missing something.

Comments?

Hope that helps,
--
Gustavo Franco

--- sound/oss/wavfront.c.orig     2004-05-22 18:19:03.000000000 -0300
+++ sound/oss/wavfront.c  2004-05-22 18:28:38.000000000 -0300
@@ -2424,7 +2424,7 @@
           consumes 16.
        */
                                                                                                     

-       if (check_region (io_base, 16)) {
+       if (!request_region (io_base, 16, "wavefront")) {
                printk (KERN_ERR LOGNAME "IO address range 0x%x - 0x%x "
                        "already in use - ignored\n", dev.base,
                        dev.base+15);
@@ -2820,10 +2820,18 @@
                return -1;
        }
                                                                                                     

-       request_region (dev.base+2, 6, "wavefront synth");
+       if(!request_region (dev.base+2, 6, "wavefront synth")) {
+               printk (KERN_ERR LOGNAME "IO address range 0x%x - 0x%x "
+                                       "already in use\n", dev.base+2,
+                                       dev.base+7);
+       }
                                                                                                     

        if (dev.has_fx) {
-               request_region (dev.base+8, 8, "wavefront fx");
+               if(!request_region (dev.base+8, 8, "wavefront fx")) {
+                       printk (KERN_ERR LOGNAME "IO address range 0x%x -"
+                                       "0x%x already in use\n", dev.base+8,
+                                       dev.base+15);
+               }
        }
                                                                                                     

        if (wavefront_config_midi ()) {

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
