From: Michael Veeck <michael.veeck@gmx.net>
Date: Mon, 12 Jul 2004 15:37:02 +0000
Subject: [Kernel-janitors] [PATCH] drivers/isdn/hardware/eicon minmax removal
Message-Id: <40F2B01E.3020406@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010304000009070704060400"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010304000009070704060400
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

This patch (against 2.6.8-rc1) removes minmax-macros and changes calls
to use kernel.h macros instead.

Basically just a resend of an older one to keep it in the patchset.

Best regards
Veeck


--------------010304000009070704060400
Content-Type: text/plain;
 name="drivers-isdn-minmax.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drivers-isdn-minmax.patch"

diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/debug.c linux-2.6.8-rc1/drivers/isdn/hardware/eicon/debug.c
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/debug.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/debug.c	2004-07-12 16:43:00.000000000 +0200
@@ -736,14 +736,14 @@ int diva_get_driver_info (dword id, byte
 
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
diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/di.c linux-2.6.8-rc1/drivers/isdn/hardware/eicon/di.c
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/di.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/di.c	2004-07-12 16:43:00.000000000 +0200
@@ -136,7 +136,7 @@ void pr_out(ADAPTER * a)
     i = this->XCurrent;
     X = PTR_X(a,this);
     while(i<this->XNum && length<270) {
-      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+      clength = min_t(word, 270-length,X[i].PLength-this->XOffset);
       a->ram_out_buffer(a,
                         &ReqOut->XBuffer.P[length],
                         PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -388,7 +388,7 @@ void scom_out(ADAPTER * a)
   i = this->XCurrent;
   X = PTR_X(a, this);
   while(i<this->XNum && length<270) {
-    clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
+    clength = min_t(word, 270-length,X[i].PLength-this->XOffset);
     a->ram_out_buffer(a,
                       &RAM->XBuffer.P[length],
                       PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -816,7 +816,7 @@ byte isdn_ind(ADAPTER * a,
                                                      sizeof(a->stream_buffer),
                                                      &final, 0, 0);
         }
-        IoAdapter->RBuffer.length = MIN(MLength, 270);
+        IoAdapter->RBuffer.length = min_t(word, MLength, 270);
         if (IoAdapter->RBuffer.length != MLength) {
           this->complete = 0;
         } else {
@@ -870,9 +870,9 @@ byte isdn_ind(ADAPTER * a,
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
diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/divamnt.c linux-2.6.8-rc1/drivers/isdn/hardware/eicon/divamnt.c
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/divamnt.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/divamnt.c	2004-07-12 16:43:00.000000000 +0200
@@ -260,7 +260,7 @@ maint_read(struct file *file, char *buf,
 		pstr += str_msg[1];	/* head + offset */
 		str_length = str_msg[0] - str_msg[1];	/* length - offset */
 	}
-	str_length = MIN(str_length, count);
+	str_length = min_t(int, str_length, count);
 
 	if (diva_os_copy_to_user(NULL, buf, pstr, str_length)) {
 		diva_os_free_tbuffer(0, str_msg);
diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/io.c linux-2.6.8-rc1/drivers/isdn/hardware/eicon/io.c
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/io.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/io.c	2004-07-12 16:43:00.000000000 +0200
@@ -261,7 +261,7 @@ void request(PISDN_ADAPTER IoAdapter, EN
     case IDI_SYNC_REQ_XDI_GET_CAPI_PARAMS: {
        diva_xdi_get_capi_parameters_t prms, *pI = &syncReq->xdi_capi_prms.info;
        memset (&prms, 0x00, sizeof(prms));
-       prms.structure_length = MIN(sizeof(prms), pI->structure_length);
+       prms.structure_length = min(sizeof(prms), pI->structure_length);
        memset (pI, 0x00, pI->structure_length);
        prms.flag_dynamic_l1_down    = (IoAdapter->capi_cfg.cfg_1 & \
          DIVA_XDI_CAPI_CFG_1_DYNAMIC_L1_ON) ? 1 : 0;
diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/istream.c linux-2.6.8-rc1/drivers/isdn/hardware/eicon/istream.c
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/istream.c	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/istream.c	2004-07-12 16:43:00.000000000 +0200
@@ -92,7 +92,7 @@ int diva_istream_write (void* context,
     return (-1); /* was not able to write       */
    break;     /* only part of message was written */
   }
-  to_write = MIN(length, DIVA_DFIFO_DATA_SZ);
+  to_write = min(length, DIVA_DFIFO_DATA_SZ);
   if (to_write) {
    a->ram_out_buffer (a,
 #ifdef PLATFORM_GT_32BIT
@@ -176,7 +176,7 @@ int diva_istream_read (void* context,
     return (-1); /* was not able to read */
    break;
   }
-  to_read = MIN(max_length, tmp[1]);
+  to_read = min_t(int, max_length, tmp[1]);
   if (to_read) {
    a->ram_in_buffer(a,
 #ifdef PLATFORM_GT_32BIT
diff -uprN -X dontdiff linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/platform.h linux-2.6.8-rc1/drivers/isdn/hardware/eicon/platform.h
--- linux-2.6.8-rc1-old/drivers/isdn/hardware/eicon/platform.h	2004-07-04 11:04:14.000000000 +0200
+++ linux-2.6.8-rc1/drivers/isdn/hardware/eicon/platform.h	2004-07-12 16:43:00.000000000 +0200
@@ -84,14 +84,6 @@
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


--------------010304000009070704060400
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010304000009070704060400--
