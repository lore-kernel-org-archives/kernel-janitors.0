From: Karsten Keil <kkeil@suse.de>
Date: Sun, 25 Feb 2007 18:49:51 +0000
Subject: [KJ] [PATCH] Fix bufferoverflow and races in capi debug functions
Message-Id: <20070225184951.GA8615@pingi.kke.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

The CAPI trace debug functions were using a fixed size buffer, which can be
overflowed if wrong formatted CAPI messages were sent to the kernel capi
layer. The code was also not protected against multiple callers.
This fix bug 8028.
Additional the patch make the CAPI trace functions optional.

Signed-off-by: Karsten Keil <kkeil@suse.de>

---

 drivers/isdn/capi/Kconfig     |   16 ++-
 drivers/isdn/capi/capidrv.c   |   28 ++++
 drivers/isdn/capi/capiutil.c  |  256 +++++++++++++++++++++++++++++++++----=
----
 drivers/isdn/capi/kcapi.c     |   77 +++++++++---
 include/linux/isdn/capiutil.h |   21 +++
 5 files changed, 319 insertions(+), 79 deletions(-)

5d857634c1a1dc0e9302a5e4c29561f0a9bc735f
diff --git a/drivers/isdn/capi/Kconfig b/drivers/isdn/capi/Kconfig
index 8b6c9a4..c921d6c 100644
--- a/drivers/isdn/capi/Kconfig
+++ b/drivers/isdn/capi/Kconfig
@@ -2,13 +2,25 @@
 # Config.in for the CAPI subsystem
 #
 config ISDN_DRV_AVMB1_VERBOSE_REASON
-	bool "Verbose reason code reporting (kernel size +=3D7K)"
+	bool "Verbose reason code reporting"
 	depends on ISDN_CAPI
+	default y
 	help
-	  If you say Y here, the AVM B1 driver will give verbose reasons for
+	  If you say Y here, the CAPI drivers will give verbose reasons for
 	  disconnecting. This will increase the size of the kernel by 7 KB. If
 	  unsure, say Y.
=20
+config CAPI_TRACE
+	bool "CAPI trace support"
+	depends on ISDN_CAPI
+	default y
+	help
+	  If you say Y here, the kernelcapi driver can make verbose traces
+	  of CAPI messages. This feature can be enabled/disabled via IOCTL for
+	  every controler (default disabled).
+	  This will increase the size of the kernelcapi module by 20 KB.
+	  If unsure, say Y.
+
 config ISDN_CAPI_MIDDLEWARE
 	bool "CAPI2.0 Middleware support (EXPERIMENTAL)"
 	depends on ISDN_CAPI && EXPERIMENTAL
diff --git a/drivers/isdn/capi/capidrv.c b/drivers/isdn/capi/capidrv.c
index 2a49cea..51b5d32 100644
--- a/drivers/isdn/capi/capidrv.c
+++ b/drivers/isdn/capi/capidrv.c
@@ -990,6 +990,7 @@ static void handle_plci(_cmsg * cmsg)
 	capidrv_contr *card =3D findcontrbynumber(cmsg->adr.adrController & 0x7f);
 	capidrv_plci *plcip;
 	isdn_ctrl cmd;
+	_cdebbuf *cdb;
=20
 	if (!card) {
 		printk(KERN_ERR "capidrv: %s from unknown controller 0x%x\n",
@@ -1122,8 +1123,15 @@ static void handle_plci(_cmsg * cmsg)
 				break;
 			}
 		}
-		printk(KERN_ERR "capidrv-%d: %s\n",
-				card->contrnr, capi_cmsg2str(cmsg));
+		cdb =3D capi_cmsg2str(cmsg);
+		if (cdb) {
+			printk(KERN_WARNING "capidrv-%d: %s\n",
+				card->contrnr, cdb->buf);
+			cdebbuf_free(cdb);
+		} else
+			printk(KERN_WARNING "capidrv-%d: CAPI_INFO_IND InfoNumber %x not handle=
d\n",
+				card->contrnr, cmsg->InfoNumber);
+		=09
 		break;
=20
 	case CAPI_CONNECT_ACTIVE_CONF:		/* plci */
@@ -1371,10 +1379,18 @@ static _cmsg s_cmsg;
 static void capidrv_recv_message(struct capi20_appl *ap, struct sk_buff *s=
kb)
 {
 	capi_message2cmsg(&s_cmsg, skb->data);
-	if (debugmode > 3)
-		printk(KERN_DEBUG "capidrv_signal: applid=3D%d %s\n",
-		       ap->applid, capi_cmsg2str(&s_cmsg));
-=09
+	if (debugmode > 3) {
+		_cdebbuf *cdb =3D capi_cmsg2str(&s_cmsg);
+
+		if (cdb) {
+			printk(KERN_DEBUG "%s: applid=3D%d %s\n", __FUNCTION__,
+				ap->applid, cdb->buf);
+			cdebbuf_free(cdb);
+		} else
+			printk(KERN_DEBUG "%s: applid=3D%d %s not traced\n",
+				__FUNCTION__, ap->applid,
+				capi_cmd2str(s_cmsg.Command, s_cmsg.Subcommand));
+	}
 	if (s_cmsg.Command =3D CAPI_DATA_B3
 	    && s_cmsg.Subcommand =3D CAPI_IND) {
 		handle_data(&s_cmsg, skb);
diff --git a/drivers/isdn/capi/capiutil.c b/drivers/isdn/capi/capiutil.c
index c1b2155..60fd313 100644
--- a/drivers/isdn/capi/capiutil.c
+++ b/drivers/isdn/capi/capiutil.c
@@ -648,6 +648,9 @@ char *capi_cmd2str(u8 cmd, u8 subcmd)
=20
=20
 /*-------------------------------------------------------*/
+
+#ifdef CONFIG_CAPI_TRACE
+
 /*-------------------------------------------------------*/
=20
 static char *pnames[] @@ -703,44 +706,77 @@ static char *pnames[]  };
=20
=20
-static char buf[8192];
-static char *p =3D NULL;
=20
 #include <stdarg.h>
=20
 /*-------------------------------------------------------*/
-static void bufprint(char *fmt,...)
+static _cdebbuf *bufprint(_cdebbuf *cdb, char *fmt,...)
 {
 	va_list f;
+	size_t n,r;
+
+	if (!cdb)
+		return NULL;
 	va_start(f, fmt);
-	vsprintf(p, fmt, f);
+	r =3D cdb->size - cdb->pos;
+	n =3D vsnprintf(cdb->p, r, fmt, f);
 	va_end(f);
-	p +=3D strlen(p);
+	if (n >=3D r) {
+		/* truncated, need bigger buffer */
+		size_t ns =3D 2 * cdb->size;
+		u_char *nb;
+
+		while ((ns - cdb->pos) <=3D n)
+			ns *=3D 2;
+		nb =3D kmalloc(ns, GFP_ATOMIC);
+		if (!nb) {
+			cdebbuf_free(cdb);
+			return NULL;
+		}
+		memcpy(nb, cdb->buf, cdb->pos);
+		kfree(cdb->buf);
+		nb[cdb->pos] =3D 0;
+		cdb->buf =3D nb;
+		cdb->p =3D cdb->buf + cdb->pos;
+		cdb->size =3D ns;
+		va_start(f, fmt);
+		r =3D cdb->size - cdb->pos;
+		n =3D vsnprintf(cdb->p, r, fmt, f);
+		va_end(f);
+	}
+	cdb->p +=3D n;
+	cdb->pos +=3D n;
+	return cdb;
 }
=20
-static void printstructlen(u8 * m, unsigned len)
+static _cdebbuf *printstructlen(_cdebbuf *cdb, u8 * m, unsigned len)
 {
 	unsigned hex =3D 0;
+
+	if (!cdb)
+		return NULL;
 	for (; len; len--, m++)
 		if (isalnum(*m) || *m =3D ' ') {
 			if (hex)
-				bufprint(">");
-			bufprint("%c", *m);
+				cdb =3D bufprint(cdb, ">");
+			cdb =3D bufprint(cdb, "%c", *m);
 			hex =3D 0;
 		} else {
 			if (!hex)
-				bufprint("<%02x", *m);
+				cdb =3D bufprint(cdb, "<%02x", *m);
 			else
-				bufprint(" %02x", *m);
+				cdb =3D bufprint(cdb, " %02x", *m);
 			hex =3D 1;
 		}
 	if (hex)
-		bufprint(">");
+		cdb =3D bufprint(cdb, ">");
+	return cdb;
 }
=20
-static void printstruct(u8 * m)
+static _cdebbuf *printstruct(_cdebbuf *cdb, u8 * m)
 {
 	unsigned len;
+
 	if (m[0] !=3D 0xff) {
 		len =3D m[0];
 		m +=3D 1;
@@ -748,42 +784,45 @@ static void printstruct(u8 * m)
 		len =3D ((u16 *) (m + 1))[0];
 		m +=3D 3;
 	}
-	printstructlen(m, len);
+	cdb =3D printstructlen(cdb, m, len);
+	return cdb;
 }
=20
 /*-------------------------------------------------------*/
 #define NAME (pnames[cmsg->par[cmsg->p]])
=20
-static void protocol_message_2_pars(_cmsg * cmsg, int level)
+static _cdebbuf *protocol_message_2_pars(_cdebbuf *cdb, _cmsg *cmsg, int l=
evel)
 {
 	for (; TYP !=3D _CEND; cmsg->p++) {
 		int slen =3D 29 + 3 - level;
 		int i;
=20
-		bufprint("  ");
+		if (!cdb)
+			return NULL;
+		cdb =3D bufprint(cdb, "  ");
 		for (i =3D 0; i < level - 1; i++)
-			bufprint(" ");
+			cdb =3D bufprint(cdb, " ");
=20
 		switch (TYP) {
 		case _CBYTE:
-			bufprint("%-*s =3D 0x%x\n", slen, NAME, *(u8 *) (cmsg->m + cmsg->l));
+			cdb =3D bufprint(cdb, "%-*s =3D 0x%x\n", slen, NAME, *(u8 *) (cmsg->m +=
 cmsg->l));
 			cmsg->l++;
 			break;
 		case _CWORD:
-			bufprint("%-*s =3D 0x%x\n", slen, NAME, *(u16 *) (cmsg->m + cmsg->l));
+			cdb =3D bufprint(cdb, "%-*s =3D 0x%x\n", slen, NAME, *(u16 *) (cmsg->m =
+ cmsg->l));
 			cmsg->l +=3D 2;
 			break;
 		case _CDWORD:
-			bufprint("%-*s =3D 0x%lx\n", slen, NAME, *(u32 *) (cmsg->m + cmsg->l));
+			cdb =3D bufprint(cdb, "%-*s =3D 0x%lx\n", slen, NAME, *(u32 *) (cmsg->m=
 + cmsg->l));
 			cmsg->l +=3D 4;
 			break;
 		case _CSTRUCT:
-			bufprint("%-*s =3D ", slen, NAME);
+			cdb =3D bufprint(cdb, "%-*s =3D ", slen, NAME);
 			if (cmsg->m[cmsg->l] =3D '\0')
-				bufprint("default");
+				cdb =3D bufprint(cdb, "default");
 			else
-				printstruct(cmsg->m + cmsg->l);
-			bufprint("\n");
+				cdb =3D printstruct(cdb, cmsg->m + cmsg->l);
+			cdb =3D bufprint(cdb, "\n");
 			if (cmsg->m[cmsg->l] !=3D 0xff)
 				cmsg->l +=3D 1 + cmsg->m[cmsg->l];
 			else
@@ -794,61 +833,184 @@ static void protocol_message_2_pars(_cms
 		case _CMSTRUCT:
 /*----- Metastruktur 0 -----*/
 			if (cmsg->m[cmsg->l] =3D '\0') {
-				bufprint("%-*s =3D default\n", slen, NAME);
+				cdb =3D bufprint(cdb, "%-*s =3D default\n", slen, NAME);
 				cmsg->l++;
 				jumpcstruct(cmsg);
 			} else {
 				char *name =3D NAME;
 				unsigned _l =3D cmsg->l;
-				bufprint("%-*s\n", slen, name);
+				cdb =3D bufprint(cdb, "%-*s\n", slen, name);
 				cmsg->l =3D (cmsg->m + _l)[0] =3D 255 ? cmsg->l + 3 : cmsg->l + 1;
 				cmsg->p++;
-				protocol_message_2_pars(cmsg, level + 1);
+				cdb =3D protocol_message_2_pars(cdb, cmsg, level + 1);
 			}
 			break;
 		}
 	}
+	return cdb;
 }
 /*-------------------------------------------------------*/
-char *capi_message2str(u8 * msg)
+
+static _cdebbuf *g_debbuf;
+static u_long g_debbuf_lock;
+static _cmsg *g_cmsg;
+
+_cdebbuf *cdebbuf_alloc(void)
+{
+	_cdebbuf *cdb;
+
+	if (likely(!test_and_set_bit(1, &g_debbuf_lock))) {
+		cdb =3D g_debbuf;
+		goto init;
+	} else
+		cdb =3D kmalloc(sizeof(_cdebbuf), GFP_ATOMIC);
+	if (!cdb)
+		return NULL;
+	cdb->buf =3D kmalloc(CDEBUG_SIZE, GFP_ATOMIC);
+	if (!cdb->buf) {
+		kfree(cdb);
+		return NULL;
+	}
+	cdb->size =3D CDEBUG_SIZE;
+init:
+	cdb->buf[0] =3D 0;
+	cdb->p =3D cdb->buf;
+	cdb->pos =3D 0;
+	return cdb;
+}
+
+void cdebbuf_free(_cdebbuf *cdb)
 {
+	if (likely(cdb =3D g_debbuf)) {
+		test_and_clear_bit(1, &g_debbuf_lock);
+		return;
+	}
+	if (likely(cdb))
+		kfree(cdb->buf);
+	kfree(cdb);
+}
+=09
=20
-	_cmsg cmsg;
-	p =3D buf;
-	p[0] =3D 0;
-
-	cmsg.m =3D msg;
-	cmsg.l =3D 8;
-	cmsg.p =3D 0;
-	byteTRcpy(cmsg.m + 4, &cmsg.Command);
-	byteTRcpy(cmsg.m + 5, &cmsg.Subcommand);
-	cmsg.par =3D cpars[command_2_index(cmsg.Command, cmsg.Subcommand)];
+_cdebbuf *capi_message2str(u8 * msg)
+{
+	_cdebbuf *cdb;
+	_cmsg	*cmsg;
=20
-	bufprint("%-26s ID=3D%03d #0x%04x LEN=3D%04d\n",
-		 mnames[command_2_index(cmsg.Command, cmsg.Subcommand)],
+	cdb =3D cdebbuf_alloc();
+	if (unlikely(!cdb))
+		return NULL;
+	if (likely(cdb =3D g_debbuf))
+		cmsg =3D g_cmsg;
+	else
+		cmsg =3D kmalloc(sizeof(_cmsg), GFP_ATOMIC);
+	if (unlikely(!cmsg)) {
+		cdebbuf_free(cdb);
+		return NULL;
+	}
+	cmsg->m =3D msg;
+	cmsg->l =3D 8;
+	cmsg->p =3D 0;
+	byteTRcpy(cmsg->m + 4, &cmsg->Command);
+	byteTRcpy(cmsg->m + 5, &cmsg->Subcommand);
+	cmsg->par =3D cpars[command_2_index(cmsg->Command, cmsg->Subcommand)];
+
+	cdb =3D bufprint(cdb, "%-26s ID=3D%03d #0x%04x LEN=3D%04d\n",
+		 mnames[command_2_index(cmsg->Command, cmsg->Subcommand)],
 		 ((unsigned short *) msg)[1],
 		 ((unsigned short *) msg)[3],
 		 ((unsigned short *) msg)[0]);
=20
-	protocol_message_2_pars(&cmsg, 1);
-	return buf;
+	cdb =3D protocol_message_2_pars(cdb, cmsg, 1);
+	if (unlikely(cmsg !=3D g_cmsg))
+		kfree(cmsg);
+	return cdb;
 }
=20
-char *capi_cmsg2str(_cmsg * cmsg)
+_cdebbuf *capi_cmsg2str(_cmsg * cmsg)
 {
-	p =3D buf;
-	p[0] =3D 0;
+	_cdebbuf *cdb;
+=09
+	cdb =3D cdebbuf_alloc();
+	if (!cdb)
+		return NULL;
 	cmsg->l =3D 8;
 	cmsg->p =3D 0;
-	bufprint("%s ID=3D%03d #0x%04x LEN=3D%04d\n",
+	cdb =3D bufprint(cdb, "%s ID=3D%03d #0x%04x LEN=3D%04d\n",
 		 mnames[command_2_index(cmsg->Command, cmsg->Subcommand)],
 		 ((u16 *) cmsg->m)[1],
 		 ((u16 *) cmsg->m)[3],
 		 ((u16 *) cmsg->m)[0]);
-	protocol_message_2_pars(cmsg, 1);
-	return buf;
+	cdb =3D protocol_message_2_pars(cdb, cmsg, 1);
+	return cdb;
 }
=20
+int __init cdebug_init(void)
+{
+	g_cmsg=3D kmalloc(sizeof(_cmsg), GFP_KERNEL);
+	if (!g_cmsg)
+		return ENOMEM;
+	g_debbuf =3D kmalloc(sizeof(_cdebbuf), GFP_KERNEL);
+	if (!g_debbuf) {
+		kfree(g_cmsg);
+		return ENOMEM;
+	}
+	g_debbuf->buf =3D kmalloc(CDEBUG_GSIZE, GFP_KERNEL);
+	if (!g_debbuf->buf) {
+		kfree(g_cmsg);
+		kfree(g_debbuf);
+		return ENOMEM;;
+	}
+	g_debbuf->size =3D CDEBUG_GSIZE;
+	g_debbuf->buf[0] =3D 0;
+	g_debbuf->p =3D g_debbuf->buf;
+	g_debbuf->pos =3D 0;
+	return 0;
+}
+
+void __exit cdebug_exit(void)
+{
+	if (g_debbuf)
+		kfree(g_debbuf->buf);
+	kfree(g_debbuf);
+	kfree(g_cmsg);
+}
+
+#else /* !CONFIG_CAPI_TRACE */
+
+static _cdebbuf g_debbuf =3D {"CONFIG_CAPI_TRACE not enabled", NULL, 0, 0};
+
+_cdebbuf *capi_message2str(u8 * msg)
+{
+	return &g_debbuf;
+}
+
+_cdebbuf *capi_cmsg2str(_cmsg * cmsg)
+{
+	return &g_debbuf;
+}
+
+_cdebbuf *cdebbuf_alloc(void)
+{
+	return &g_debbuf;
+}
+
+void cdebbuf_free(_cdebbuf *cdb)
+{
+}
+
+int __init cdebug_init(void)
+{
+	return 0;
+}
+
+void __exit cdebug_exit(void)
+{
+}
+
+#endif
+
+EXPORT_SYMBOL(cdebbuf_alloc);
+EXPORT_SYMBOL(cdebbuf_free);
 EXPORT_SYMBOL(capi_cmsg2message);
 EXPORT_SYMBOL(capi_message2cmsg);
 EXPORT_SYMBOL(capi_cmsg_header);
diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
index 783a255..b6f5e8a 100644
--- a/drivers/isdn/capi/kcapi.c
+++ b/drivers/isdn/capi/kcapi.c
@@ -276,10 +276,17 @@ void capi_ctr_handle_message(struct capi
 	int showctl =3D 0;
 	u8 cmd, subcmd;
 	unsigned long flags;
+	_cdebbuf *cdb;
=20
 	if (card->cardstate !=3D CARD_RUNNING) {
-		printk(KERN_INFO "kcapi: controller %d not active, got: %s",
-		       card->cnr, capi_message2str(skb->data));
+		cdb =3D capi_message2str(skb->data);
+		if (cdb) {=20
+			printk(KERN_INFO "kcapi: controller [%03d] not active, got: %s",
+				card->cnr, cdb->buf);
+			cdebbuf_free(cdb);
+		} else
+			printk(KERN_INFO "kcapi: controller [%03d] not active, cannot trace\n",
+				card->cnr);
 		goto error;
 	}
=20
@@ -295,15 +302,21 @@ void capi_ctr_handle_message(struct capi
 	showctl |=3D (card->traceflag & 1);
 	if (showctl & 2) {
 		if (showctl & 1) {
-			printk(KERN_DEBUG "kcapi: got [0x%lx] id#%d %s len=3D%u\n",
-			       (unsigned long) card->cnr,
-			       CAPIMSG_APPID(skb->data),
+			printk(KERN_DEBUG "kcapi: got [%03d] id#%d %s len=3D%u\n",
+			       card->cnr, CAPIMSG_APPID(skb->data),
 			       capi_cmd2str(cmd, subcmd),
 			       CAPIMSG_LEN(skb->data));
 		} else {
-			printk(KERN_DEBUG "kcapi: got [0x%lx] %s\n",
-					(unsigned long) card->cnr,
-					capi_message2str(skb->data));
+			cdb =3D capi_message2str(skb->data);
+			if (cdb) {
+				printk(KERN_DEBUG "kcapi: got [%03d] %s\n",
+					card->cnr, cdb->buf);
+				cdebbuf_free(cdb);
+			} else
+				printk(KERN_DEBUG "kcapi: got [%03d] id#%d %s len=3D%u, cannot trace\n=
",
+					card->cnr, CAPIMSG_APPID(skb->data),
+					capi_cmd2str(cmd, subcmd),
+					CAPIMSG_LEN(skb->data));
 		}
=20
 	}
@@ -312,8 +325,15 @@ void capi_ctr_handle_message(struct capi
 	ap =3D get_capi_appl_by_nr(CAPIMSG_APPID(skb->data));
 	if ((!ap) || (ap->release_in_progress)) {
 		read_unlock_irqrestore(&application_lock, flags);
-		printk(KERN_ERR "kcapi: handle_message: applid %d state released (%s)\n",
-			CAPIMSG_APPID(skb->data), capi_message2str(skb->data));
+		cdb =3D capi_message2str(skb->data);
+		if (cdb) {
+			printk(KERN_ERR "kcapi: handle_message: applid %d state released (%s)\n=
",
+			CAPIMSG_APPID(skb->data), cdb->buf);
+			cdebbuf_free(cdb);
+		} else
+			printk(KERN_ERR "kcapi: handle_message: applid %d state released (%s) c=
annot trace\n",
+				CAPIMSG_APPID(skb->data),
+				capi_cmd2str(cmd, subcmd));
 		goto error;
 	}
 	skb_queue_tail(&ap->recv_queue, skb);
@@ -332,7 +352,7 @@ void capi_ctr_ready(struct capi_ctr * ca
 {
 	card->cardstate =3D CARD_RUNNING;
=20
-        printk(KERN_NOTICE "kcapi: card %d \"%s\" ready.\n",
+        printk(KERN_NOTICE "kcapi: card [%03d] \"%s\" ready.\n",
 	       card->cnr, card->name);
=20
 	notify_push(KCI_CONTRUP, card->cnr, 0, 0);
@@ -364,7 +384,7 @@ void capi_ctr_reseted(struct capi_ctr *=20
 		capi_ctr_put(card);
 	}
=20
-	printk(KERN_NOTICE "kcapi: card %d down.\n", card->cnr);
+	printk(KERN_NOTICE "kcapi: card [%03d] down.\n", card->cnr);
=20
 	notify_push(KCI_CONTRDOWN, card->cnr, 0, 0);
 }
@@ -374,7 +394,7 @@ EXPORT_SYMBOL(capi_ctr_reseted);
 void capi_ctr_suspend_output(struct capi_ctr *card)
 {
 	if (!card->blocked) {
-		printk(KERN_DEBUG "kcapi: card %d suspend\n", card->cnr);
+		printk(KERN_DEBUG "kcapi: card [%03d] suspend\n", card->cnr);
 		card->blocked =3D 1;
 	}
 }
@@ -384,7 +404,7 @@ EXPORT_SYMBOL(capi_ctr_suspend_output);
 void capi_ctr_resume_output(struct capi_ctr *card)
 {
 	if (card->blocked) {
-		printk(KERN_DEBUG "kcapi: card %d resume\n", card->cnr);
+		printk(KERN_DEBUG "kcapi: card [%03d] resume\n", card->cnr);
 		card->blocked =3D 0;
 	}
 }
@@ -432,7 +452,7 @@ attach_capi_ctr(struct capi_ctr *card)
 	}
=20
 	ncards++;
-	printk(KERN_NOTICE "kcapi: Controller %d: %s attached\n",
+	printk(KERN_NOTICE "kcapi: Controller [%03d]: %s attached\n",
 			card->cnr, card->name);
 	return 0;
 }
@@ -451,7 +471,7 @@ int detach_capi_ctr(struct capi_ctr *car
 	   card->procent =3D NULL;
 	}
 	capi_cards[card->cnr - 1] =3D NULL;
-	printk(KERN_NOTICE "kcapi: Controller %d: %s unregistered\n",
+	printk(KERN_NOTICE "kcapi: Controller [%03d]: %s unregistered\n",
 			card->cnr, card->name);
=20
 	return 0;
@@ -623,17 +643,25 @@ u16 capi20_put_message(struct capi20_app
 	showctl |=3D (card->traceflag & 1);
 	if (showctl & 2) {
 		if (showctl & 1) {
-			printk(KERN_DEBUG "kcapi: put [%#x] id#%d %s len=3D%u\n",
+			printk(KERN_DEBUG "kcapi: put [%03d] id#%d %s len=3D%u\n",
 			       CAPIMSG_CONTROLLER(skb->data),
 			       CAPIMSG_APPID(skb->data),
 			       capi_cmd2str(cmd, subcmd),
 			       CAPIMSG_LEN(skb->data));
 		} else {
-			printk(KERN_DEBUG "kcapi: put [%#x] %s\n",
-			       CAPIMSG_CONTROLLER(skb->data),
-			       capi_message2str(skb->data));
+			_cdebbuf *cdb =3D capi_message2str(skb->data);
+			if (cdb) {
+				printk(KERN_DEBUG "kcapi: put [%03d] %s\n",
+					CAPIMSG_CONTROLLER(skb->data),
+					cdb->buf);
+				cdebbuf_free(cdb);
+			} else
+				printk(KERN_DEBUG "kcapi: put [%03d] id#%d %s len=3D%u cannot trace\n",
+					CAPIMSG_CONTROLLER(skb->data),
+					CAPIMSG_APPID(skb->data),
+					capi_cmd2str(cmd, subcmd),
+					CAPIMSG_LEN(skb->data));
 		}
-
 	}
 	return card->send_message(card, skb);
 }
@@ -894,7 +922,7 @@ int capi20_manufacturer(unsigned int cmd
 			return -ESRCH;
=20
 		card->traceflag =3D fdef.flag;
-		printk(KERN_INFO "kcapi: contr %d set trace=3D%d\n",
+		printk(KERN_INFO "kcapi: contr [%03d] set trace=3D%d\n",
 			card->cnr, card->traceflag);
 		return 0;
 	}
@@ -967,7 +995,11 @@ static int __init kcapi_init(void)
 {
 	char *p;
 	char rev[32];
+	int ret;
=20
+	ret =3D cdebug_init();
+	if (ret)
+		return ret;
         kcapi_proc_init();
=20
 	if ((p =3D strchr(revision, ':')) !=3D 0 && p[1]) {
@@ -988,6 +1020,7 @@ static void __exit kcapi_exit(void)
=20
 	/* make sure all notifiers are finished */
 	flush_scheduled_work();
+	cdebug_exit();
 }
=20
 module_init(kcapi_init);
diff --git a/include/linux/isdn/capiutil.h b/include/linux/isdn/capiutil.h
index 2e79f81..63bd9cf 100644
--- a/include/linux/isdn/capiutil.h
+++ b/include/linux/isdn/capiutil.h
@@ -174,9 +174,26 @@ char *capi_info2str(__u16 reason);
 /*
  * Debugging / Tracing functions
  */
+
 char *capi_cmd2str(__u8 cmd, __u8 subcmd);
-char *capi_cmsg2str(_cmsg * cmsg);
-char *capi_message2str(__u8 * msg);
+
+typedef struct {
+	u_char	*buf;
+	u_char	*p;
+	size_t	size;
+	size_t	pos;
+} _cdebbuf;
+
+#define	CDEBUG_SIZE	1024
+#define	CDEBUG_GSIZE	4096
+
+_cdebbuf *cdebbuf_alloc(void);
+void cdebbuf_free(_cdebbuf *cdb);
+int cdebug_init(void);
+void cdebug_exit(void);
+
+_cdebbuf *capi_cmsg2str(_cmsg *cmsg);
+_cdebbuf *capi_message2str(__u8 *msg);
=20
 /*-----------------------------------------------------------------------*/
=20
--=20
1.2.4


--=20
Karsten Keil
SuSE Labs
ISDN development
SUSE LINUX Products GmbH, GF: Markus Rex, HRB 16746 (AG N=FCrnberg)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
