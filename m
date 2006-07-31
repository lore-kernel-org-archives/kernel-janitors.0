From: =?iso-8859-15?Q?Cl=E9ment?= Stenac <zorglub@diwi.org>
Date: Mon, 31 Jul 2006 22:13:29 +0000
Subject: [KJ] [PATCH] Use standard min/max macros [1/3]
Message-Id: <20060731221329.GA31140@diwi.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Remove some custom type-unsafe MIN/MAX macros in favor of type-checking
min/max from kernel.h

Signed-off-by: Cl=E9ment Stenac <zorglub@diwi.org>
---=20

This is my very first patch submission, reviews are welcome.

As this patch switches to type-checking macros, it reveals a number of
warnings due to bogus comparisons (mostly signed/unsigned). I plan to do
another set of patches for some of these.

diff --git a/drivers/isdn/hardware/eicon/debug.c b/drivers/isdn/hardware/ei=
con/debug.c
index 6851c62..f55d679 100644
--- a/drivers/isdn/hardware/eicon/debug.c
+++ b/drivers/isdn/hardware/eicon/debug.c
@@ -756,14 +756,14 @@ int diva_get_driver_info (dword id, byte
=20
     data_length -=3D 9;
=20
-    if ((to_copy =3D MIN(strlen(clients[id].drvName), data_length-1))) {
+    if ((to_copy =3D min(strlen(clients[id].drvName), data_length-1))) {
       memcpy (p, clients[id].drvName, to_copy);
       p +=3D to_copy;
       data_length -=3D to_copy;
       if ((data_length >=3D 4) && clients[id].hDbg->drvTag[0]) {
         *p++ =3D '(';
         data_length -=3D 1;
-        if ((to_copy =3D MIN(strlen(clients[id].hDbg->drvTag), data_length=
-2))) {
+        if ((to_copy =3D min(strlen(clients[id].hDbg->drvTag), data_length=
-2))) {
           memcpy (p, clients[id].hDbg->drvTag, to_copy);
           p +=3D to_copy;
           data_length -=3D to_copy;
diff --git a/drivers/isdn/hardware/eicon/di.c b/drivers/isdn/hardware/eicon=
/di.c
index 0617d7c..6e65d2c 100644
--- a/drivers/isdn/hardware/eicon/di.c
+++ b/drivers/isdn/hardware/eicon/di.c
@@ -133,7 +133,7 @@ #endif
     i =3D this->XCurrent;
     X =3D PTR_X(a,this);
     while(i<this->XNum && length<270) {
-      clength =3D MIN((word)(270-length),X[i].PLength-this->XOffset);
+      clength =3D min((word)(270-length),X[i].PLength-this->XOffset);
       a->ram_out_buffer(a,
                         &ReqOut->XBuffer.P[length],
                         PTR_P(a,this,&X[i].P[this->XOffset]),
@@ -622,7 +622,7 @@ #endif
                                                      sizeof(a->stream_buff=
er),
                                                      &final, NULL, NULL);
         }
-        IoAdapter->RBuffer.length =3D MIN(MLength, 270);
+        IoAdapter->RBuffer.length =3D min(MLength, 270);
         if (IoAdapter->RBuffer.length !=3D MLength) {
           this->complete =3D 0;
         } else {
@@ -676,9 +676,9 @@ #endif
         this->RCurrent++;
       }
       if (cma) {
-        clength =3D MIN(MLength, R[this->RCurrent].PLength-this->ROffset);
+        clength =3D min(MLength, R[this->RCurrent].PLength-this->ROffset);
       } else {
-        clength =3D MIN(a->ram_inw(a, &RBuffer->length)-offset,
+        clength =3D min(a->ram_inw(a, &RBuffer->length)-offset,
                       R[this->RCurrent].PLength-this->ROffset);
       }
       if(R[this->RCurrent].P) {
diff --git a/drivers/isdn/hardware/eicon/io.c b/drivers/isdn/hardware/eicon=
/io.c
index 4a27e23..7e197c7 100644
--- a/drivers/isdn/hardware/eicon/io.c
+++ b/drivers/isdn/hardware/eicon/io.c
@@ -262,7 +262,7 @@ #endif
     case IDI_SYNC_REQ_XDI_GET_CAPI_PARAMS: {
        diva_xdi_get_capi_parameters_t prms, *pI =3D &syncReq->xdi_capi_prm=
s.info;
        memset (&prms, 0x00, sizeof(prms));
-       prms.structure_length =3D MIN(sizeof(prms), pI->structure_length);
+       prms.structure_length =3D min(sizeof(prms), pI->structure_length);
        memset (pI, 0x00, pI->structure_length);
        prms.flag_dynamic_l1_down    =3D (IoAdapter->capi_cfg.cfg_1 & \
          DIVA_XDI_CAPI_CFG_1_DYNAMIC_L1_ON) ? 1 : 0;
diff --git a/drivers/isdn/hardware/eicon/istream.c b/drivers/isdn/hardware/=
eicon/istream.c
index 2313966..87133db 100644
--- a/drivers/isdn/hardware/eicon/istream.c
+++ b/drivers/isdn/hardware/eicon/istream.c
@@ -92,7 +92,7 @@ #endif
     return (-1); /* was not able to write       */
    break;     /* only part of message was written */
   }
-  to_write =3D MIN(length, DIVA_DFIFO_DATA_SZ);
+  to_write =3D min(length, DIVA_DFIFO_DATA_SZ);
   if (to_write) {
    a->ram_out_buffer (a,
 #ifdef PLATFORM_GT_32BIT
@@ -176,7 +176,7 @@ #endif
     return (-1); /* was not able to read */
    break;
   }
-  to_read =3D MIN(max_length, tmp[1]);
+  to_read =3D min(max_length, tmp[1]);
   if (to_read) {
    a->ram_in_buffer(a,
 #ifdef PLATFORM_GT_32BIT
diff --git a/drivers/isdn/hardware/eicon/platform.h b/drivers/isdn/hardware=
/eicon/platform.h
index a66836c..2444811 100644
--- a/drivers/isdn/hardware/eicon/platform.h
+++ b/drivers/isdn/hardware/eicon/platform.h
@@ -83,14 +83,6 @@ #ifndef	NULL
 #define	NULL	((void *) 0)
 #endif
=20
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
diff --git a/drivers/net/wan/pc300_drv.c b/drivers/net/wan/pc300_drv.c
index 567efff..6d943df 100644
--- a/drivers/net/wan/pc300_drv.c
+++ b/drivers/net/wan/pc300_drv.c
@@ -270,13 +270,6 @@ static struct pci_device_id cpc_pci_dev_
 };
 MODULE_DEVICE_TABLE(pci, cpc_pci_dev_id);
=20
-#ifndef cpc_min
-#define	cpc_min(a,b)	(((a)<(b))?(a):(b))
-#endif
-#ifndef cpc_max
-#define	cpc_max(a,b)	(((a)>(b))?(a):(b))
-#endif
-
 /* prototypes */
 static void tx_dma_buf_pt_init(pc300_t *, int);
 static void tx_dma_buf_init(pc300_t *, int);
@@ -477,7 +470,7 @@ static int dma_buf_write(pc300_t * card,
 	for (i =3D 0; i < nbuf; i++) {
 		ptdescr =3D (card->hw.rambase +
 					  TX_BD_ADDR(ch, card->chan[ch].tx_next_bd));
-		nchar =3D cpc_min(BD_DEF_LEN, tosend);
+		nchar =3D min(BD_DEF_LEN, tosend);
 		if (cpc_readb(&ptdescr->status) & DST_OSB) {
 			memcpy_toio((card->hw.rambase + cpc_readl(&ptdescr->ptbuf)),
 				    &ptdata[len - tosend], nchar);
diff --git a/include/net/irda/irda.h b/include/net/irda/irda.h
index 1cb0607..35918be 100644
--- a/include/net/irda/irda.h
+++ b/include/net/irda/irda.h
@@ -46,10 +46,6 @@ #ifndef SMALL
 #define SMALL 5
 #endif
=20
-#ifndef IRDA_MIN /* Lets not mix this MIN with other header files */
-#define IRDA_MIN(a, b) (((a) < (b)) ? (a) : (b))
-#endif
-
 #ifndef IRDA_ALIGN
 #  define IRDA_ALIGN __attribute__((aligned))
 #endif
diff --git a/net/irda/ircomm/ircomm_tty.c b/net/irda/ircomm/ircomm_tty.c
index 3bcdb46..584752d 100644
--- a/net/irda/ircomm/ircomm_tty.c
+++ b/net/irda/ircomm/ircomm_tty.c
@@ -854,7 +854,7 @@ static void ircomm_tty_wait_until_sent(s
 	orig_jiffies =3D jiffies;
=20
 	/* Set poll time to 200 ms */
-	poll_time =3D IRDA_MIN(timeout, msecs_to_jiffies(200));
+	poll_time =3D min(timeout, msecs_to_jiffies(200));
=20
 	spin_lock_irqsave(&self->spinlock, flags);
 	while (self->tx_skb && self->tx_skb->len) {
@@ -1201,7 +1201,7 @@ static int ircomm_tty_control_indication
=20
 	clen =3D skb->data[0];
=20
-	irda_param_extract_all(self, skb->data+1, IRDA_MIN(skb->len-1, clen),=20
+	irda_param_extract_all(self, skb->data+1, min(skb->len-1, clen),=20
 			       &ircomm_param_info);
=20
 	/* No need to kfree_skb - see ircomm_control_indication() */
diff --git a/net/irda/ircomm/ircomm_tty_attach.c b/net/irda/ircomm/ircomm_t=
ty_attach.c
index 99f5edd..539293e 100644
--- a/net/irda/ircomm/ircomm_tty_attach.c
+++ b/net/irda/ircomm/ircomm_tty_attach.c
@@ -543,7 +543,7 @@ void ircomm_tty_connect_indication(void=20
 	clen =3D skb->data[0];
 	if (clen)
 		irda_param_extract_all(self, skb->data+1,=20
-				       IRDA_MIN(skb->len, clen),=20
+				       min(skb->len, clen),=20
 				       &ircomm_param_info);
=20
 	ircomm_tty_do_event(self, IRCOMM_TTY_CONNECT_INDICATION, NULL, NULL);
diff --git a/net/irda/irlap_frame.c b/net/irda/irlap_frame.c
index ccb983b..73cfd18 100644
--- a/net/irda/irlap_frame.c
+++ b/net/irda/irlap_frame.c
@@ -378,7 +378,7 @@ void irlap_send_discovery_xid_frame(stru
 		info =3D skb_put(tx_skb, 1);
 		info[0] =3D discovery->data.charset;
=20
-		len =3D IRDA_MIN(discovery->name_len, skb_tailroom(tx_skb));
+		len =3D min(discovery->name_len, skb_tailroom(tx_skb));
 		info =3D skb_put(tx_skb, len);
 		memcpy(info, discovery->data.info, len);
 	}
diff --git a/net/irda/irttp.c b/net/irda/irttp.c
index 42acf1c..3a2480e 100644
--- a/net/irda/irttp.c
+++ b/net/irda/irttp.c
@@ -1216,7 +1216,7 @@ static void irttp_connect_confirm(void *
 		plen =3D skb->data[0];
=20
 		ret =3D irda_param_extract_all(self, skb->data+1,
-					     IRDA_MIN(skb->len-1, plen),
+					     min(skb->len-1, plen),
 					     &param_info);
=20
 		/* Any errors in the parameter list? */
@@ -1229,7 +1229,7 @@ static void irttp_connect_confirm(void *
 			return;
 		}
 		/* Remove parameters */
-		skb_pull(skb, IRDA_MIN(skb->len, plen+1));
+		skb_pull(skb, min(skb->len, plen+1));
 	}
=20
 	IRDA_DEBUG(4, "%s() send=3D%d,avail=3D%d,remote=3D%d\n", __FUNCTION__,
@@ -1293,7 +1293,7 @@ void irttp_connect_indication(void *inst
 		plen =3D skb->data[0];
=20
 		ret =3D irda_param_extract_all(self, skb->data+1,
-					     IRDA_MIN(skb->len-1, plen),
+					     min(skb->len-1, plen),
 					     &param_info);
=20
 		/* Any errors in the parameter list? */
@@ -1307,7 +1307,7 @@ void irttp_connect_indication(void *inst
 		}
=20
 		/* Remove parameters */
-		skb_pull(skb, IRDA_MIN(skb->len, plen+1));
+		skb_pull(skb, min(skb->len, plen+1));
 	}
=20
 	if (self->notify.connect_indication) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
