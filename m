From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 19 Feb 2004 20:54:56 +0000
Subject: [Kernel-janitors] [PATCH] drivers/isdn/hardware/eicon MIN/MAX removal
Message-Id: <403522A0.8040901@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070702040409080606020204"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070702040409080606020204
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Feedback is always welcome
Michael


--------------070702040409080606020204
Content-Type: text/plain;
 name="minmax_drivers_isdn_hardware.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_isdn_hardware.patch"

diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/debug.c linux-2.6.3.test/drivers/isdn/hardware/eicon/debug.c
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/debug.c	2004-02-18 04:58:07.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/debug.c	2004-02-19 21:12:20.000000000 +0100
@@ -736,14 +736,14 @@
 
     data_length -= 9;
 
-    if ((to_copy = MIN(strlen(clients[id].drvName), data_length-1))) {
+    if ((to_copy = min_t(int, strlen(clients[id].drvName), data_length-1))) {
       memcpy (p, clients[id].drvName, to_copy);
       p += to_copy;
       data_length -= to_copy;
       if ((data_length >= 4) && clients[id].hDbg->drvTag[0]) {
         *p++ = '(';
         data_length -= 1;
-        if ((to_copy = MIN(strlen(clients[id].hDbg->drvTag), data_length-2))) {
+        if ((to_copy = min_t(int, strlen(clients[id].hDbg->drvTag), data_length-2))) {
           memcpy (p, clients[id].hDbg->drvTag, to_copy);
           p += to_copy;
           data_length -= to_copy;
diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/di.c linux-2.6.3.test/drivers/isdn/hardware/eicon/di.c
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/di.c	2004-02-18 04:57:26.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/di.c	2004-02-19 21:12:20.000000000 +0100
@@ -136,7 +136,7 @@
     i = this->XCurrent;
     X = PTR_X(a,this);
     while(i<this->XNum && length<270) {
-      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+      clength = min_t(word, 270-length,X[i].PLength-this->XOffset);
       a->ram_out_buffer(a,
                         &ReqOut->XBuffer.P[length],
                         PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -388,7 +388,7 @@
   i = this->XCurrent;
   X = PTR_X(a, this);
   while(i<this->XNum && length<270) {
-    clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+    clength = min_t(word, 270-length,X[i].PLength-this->XOffset);
     a->ram_out_buffer(a,
                       &RAM->XBuffer.P[length],
                       PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -816,7 +816,7 @@
                                                      sizeof(a->stream_buffer),
                                                      &final, 0, 0);
         }
-        IoAdapter->RBuffer.length = MIN(MLength, 270);
+        IoAdapter->RBuffer.length = min_t(word, MLength, 270);
         if (IoAdapter->RBuffer.length != MLength) {
           this->complete = 0;
         } else {
@@ -870,9 +870,9 @@
         this->RCurrent++;
       }
       if (cma) {
-        clength = MIN(MLength, R[this->RCurrent].PLength-this->ROffset);
+        clength = min_t(word, MLength, R[this->RCurrent].PLength-this->ROffset);
       } else {
-        clength = MIN(a->ram_inw(a, &RBuffer->length)-offset,
+        clength = min(a->ram_inw(a, &RBuffer->length)-offset,
                       R[this->RCurrent].PLength-this->ROffset);
       }
       if(R[this->RCurrent].P) {
diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/divamnt.c linux-2.6.3.test/drivers/isdn/hardware/eicon/divamnt.c
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/divamnt.c	2004-02-18 04:58:01.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/divamnt.c	2004-02-19 21:12:20.000000000 +0100
@@ -260,7 +260,7 @@
 		pstr += str_msg[1];	/* head + offset */
 		str_length = str_msg[0] - str_msg[1];	/* length - offset */
 	}
-	str_length = MIN(str_length, count);
+	str_length = min_t(int, str_length, count);
 
 	if (diva_os_copy_to_user(NULL, buf, pstr, str_length)) {
 		diva_os_free_tbuffer(0, str_msg);
diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/io.c linux-2.6.3.test/drivers/isdn/hardware/eicon/io.c
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/io.c	2004-02-18 04:57:20.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/io.c	2004-02-19 21:12:20.000000000 +0100
@@ -261,7 +261,7 @@
     case IDI_SYNC_REQ_XDI_GET_CAPI_PARAMS: {
        diva_xdi_get_capi_parameters_t prms, *pI = &syncReq->xdi_capi_prms.info;
        memset (&prms, 0x00, sizeof(prms));
-       prms.structure_length = MIN(sizeof(prms), pI->structure_length);
+       prms.structure_length = min(sizeof(prms), pI->structure_length);
        memset (pI, 0x00, pI->structure_length);
        prms.flag_dynamic_l1_down    = (IoAdapter->capi_cfg.cfg_1 & \
          DIVA_XDI_CAPI_CFG_1_DYNAMIC_L1_ON) ? 1 : 0;
diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/istream.c linux-2.6.3.test/drivers/isdn/hardware/eicon/istream.c
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/istream.c	2004-02-18 04:57:20.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/istream.c	2004-02-19 21:12:20.000000000 +0100
@@ -92,7 +92,7 @@
     return (-1); /* was not able to write       */
    break;     /* only part of message was written */
   }
-  to_write = MIN(length, DIVA_DFIFO_DATA_SZ);
+  to_write = min(length, DIVA_DFIFO_DATA_SZ);
   if (to_write) {
    a->ram_out_buffer (a,
 #ifdef PLATFORM_GT_32BIT
@@ -176,7 +176,7 @@
     return (-1); /* was not able to read */
    break;
   }
-  to_read = MIN(max_length, tmp[1]);
+  to_read = min_t(int, max_length, tmp[1]);
   if (to_read) {
    a->ram_in_buffer(a,
 #ifdef PLATFORM_GT_32BIT
diff -Naur linux-2.6.3.org/drivers/isdn/hardware/eicon/platform.h linux-2.6.3.test/drivers/isdn/hardware/eicon/platform.h
--- linux-2.6.3.org/drivers/isdn/hardware/eicon/platform.h	2004-02-18 04:58:52.000000000 +0100
+++ linux-2.6.3.test/drivers/isdn/hardware/eicon/platform.h	2004-02-19 21:12:20.000000000 +0100
@@ -83,14 +83,6 @@
 #define	NULL	((void *) 0)
 #endif
 
-#ifndef	MIN
-#define MIN(a,b)	((a)>(b) ? (b) : (a))
-#endif
-
-#ifndef	MAX
-#define MAX(a,b)	((a)>(b) ? (a) : (b))
-#endif
-
 #ifndef	far
 #define far
 #endif

--------------070702040409080606020204
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070702040409080606020204--
