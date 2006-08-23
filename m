From: Janani Janakiraman <janani@us.ibm.com>
Date: Wed, 23 Aug 2006 02:55:58 +0000
Subject: [KJ] [PATCH RESEND] isdn: Changing const char *foo to const char
Message-Id: <OFB3282B97.FB5DD180-ON872571D3.000FF6F2-862571D3.00101960@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0201184549=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0201184549==
Content-Type: multipart/alternative;
    boundary="----------=_1156301814-26421-520"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1156301814-26421-520
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline

Resending so that it is in plain text format

From: Janani Janakiraman <janani@us.ibm.com>

This patch fixes the task mentioned in the Kernel Janitors TODO list (by 
Jeff Garzik) for the drivers/isdn/hisax directory in Linux Kernel Version 
2.6.17 with patch patch-2.6.18-rc4 applied. 

1) The string form

        [const] char *foo = "blah";

creates two variables in the final assembly output, a static string, and
a char pointer to the static string.  The alternate string form

        [const] char foo[] = "blah";

is better because it declares a single variable.

For variables marked __initdata, the "*foo" form causes only the
pointer, not the string itself, to be dropped from the kernel image,
which is a bug.  Using the "foo[]" form with regular 'ole local
variables also makes the assembly shorter.

Signed-off-by: Janani Janakiraman (janani@us.ibm.com)
-----------------------------------------------------------------------------
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/asuscom.c 
linux-2.6.17.isdn/drivers/isdn/hisax/asuscom.c
--- linux-2.6.17/drivers/isdn/hisax/asuscom.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/asuscom.c 2006-08-21 
15:18:23.000000000 -0500
@@ -22,7 +22,7 @@
 
 extern const char *CardType[];
 
-static const char *Asuscom_revision = "$Revision: 1.14.2.4 $";
+static const char Asuscom_revision[] = "$Revision: 1.14.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/avm_a1p.c 
linux-2.6.17.isdn/drivers/isdn/hisax/avm_a1p.c
--- linux-2.6.17/drivers/isdn/hisax/avm_a1p.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/avm_a1p.c 2006-08-21 
15:18:23.000000000 -0500
@@ -56,7 +56,7 @@
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
 
-static const char *avm_revision = "$Revision: 2.9.2.5 $";
+static const char avm_revision[] = "$Revision: 2.9.2.5 $";
 
 static inline u_char
 ReadISAC(struct IsdnCardState *cs, u_char offset)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/avm_pci.c 
linux-2.6.17.isdn/drivers/isdn/hisax/avm_pci.c
--- linux-2.6.17/drivers/isdn/hisax/avm_pci.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/avm_pci.c 2006-08-21 
15:18:23.000000000 -0500
@@ -21,7 +21,7 @@
 #include <linux/interrupt.h>
 
 extern const char *CardType[];
-static const char *avm_pci_rev = "$Revision: 1.29.2.4 $";
+static const char avm_pci_rev[] = "$Revision: 1.29.2.4 $";
 
 #define  AVM_FRITZ_PCI                          1
 #define  AVM_FRITZ_PNP                          2
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/bkm_a4t.c 
linux-2.6.17.isdn/drivers/isdn/hisax/bkm_a4t.c
--- linux-2.6.17/drivers/isdn/hisax/bkm_a4t.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/bkm_a4t.c 2006-08-21 
15:18:23.000000000 -0500
@@ -22,7 +22,7 @@
 
 extern const char *CardType[];
 
-static const char *bkm_a4t_revision = "$Revision: 1.22.2.4 $";
+static const char bkm_a4t_revision[] = "$Revision: 1.22.2.4 $";
 
 
 static inline u_char
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/callc.c 
linux-2.6.17.isdn/drivers/isdn/hisax/callc.c
--- linux-2.6.17/drivers/isdn/hisax/callc.c              2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/callc.c 2006-08-21 
15:18:23.000000000 -0500
@@ -21,7 +21,7 @@
 #include "hisax.h"
 #include <linux/isdn/capicmd.h>
 
-const char *lli_revision = "$Revision: 2.59.2.4 $";
+const char lli_revision[] = "$Revision: 2.59.2.4 $";
 
 extern struct IsdnCard cards[];
 extern int nrcards;
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/diva.c 
linux-2.6.17.isdn/drivers/isdn/hisax/diva.c
--- linux-2.6.17/drivers/isdn/hisax/diva.c               2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/diva.c          2006-08-21 
15:18:23.000000000 -0500
@@ -27,7 +27,7 @@
 
 extern const char *CardType[];
 
-static const char *Diva_revision = "$Revision: 1.33.2.6 $";
+static const char Diva_revision[] = "$Revision: 1.33.2.6 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/elsa.c 
linux-2.6.17.isdn/drivers/isdn/hisax/elsa.c
--- linux-2.6.17/drivers/isdn/hisax/elsa.c               2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/elsa.c          2006-08-21 
15:18:23.000000000 -0500
@@ -32,7 +32,7 @@
 
 extern const char *CardType[];
 
-static const char *Elsa_revision = "$Revision: 2.32.2.4 $";
+static const char Elsa_revision[] = "$Revision: 2.32.2.4 $";
 static const char *Elsa_Types[] =
 {"None", "PC", "PCC-8", "PCC-16", "PCF", "PCF-Pro",
  "PCMCIA", "QS 1000", "QS 3000", "Microlink PCI", "QS 3000 PCI", 
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/enternow_pci.c 
linux-2.6.17.isdn/drivers/isdn/hisax/enternow_pci.c
--- linux-2.6.17/drivers/isdn/hisax/enternow_pci.c 2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/enternow_pci.c 2006-08-21 
15:18:23.000000000 -0500
@@ -72,7 +72,7 @@
 
 
 
-static const char *enternow_pci_rev = "$Revision: 1.1.4.5 $";
+static const char enternow_pci_rev[] = "$Revision: 1.1.4.5 $";
 
 
 /* f?r PowerISDN PCI */
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/gazel.c 
linux-2.6.17.isdn/drivers/isdn/hisax/gazel.c
--- linux-2.6.17/drivers/isdn/hisax/gazel.c              2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/gazel.c 2006-08-21 
15:18:23.000000000 -0500
@@ -20,7 +20,7 @@
 #include <linux/pci.h>
 
 extern const char *CardType[];
-static const char *gazel_revision = "$Revision: 2.19.2.4 $";
+static const char gazel_revision[] = "$Revision: 2.19.2.4 $";
 
 #define R647      1
 #define R685      2
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/hfc_pci.c 
linux-2.6.17.isdn/drivers/isdn/hisax/hfc_pci.c
--- linux-2.6.17/drivers/isdn/hisax/hfc_pci.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfc_pci.c 2006-08-21 
15:18:23.000000000 -0500
@@ -24,7 +24,7 @@
 
 extern const char *CardType[];
 
-static const char *hfcpci_revision = "$Revision: 1.48.2.4 $";
+static const char hfcpci_revision[] = "$Revision: 1.48.2.4 $";
 
 /* table entry in the PCI devices list */
 typedef struct {
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/hfc_usb.c 
linux-2.6.17.isdn/drivers/isdn/hisax/hfc_usb.c
--- linux-2.6.17/drivers/isdn/hisax/hfc_usb.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfc_usb.c 2006-08-21 
15:18:23.000000000 -0500
@@ -43,7 +43,7 @@
 #include "hisax_if.h"
 #include "hfc_usb.h"
 
-static const char *hfcusb_revision =
+static const char hfcusb_revision[] =
     "$Revision: 2.3.2.13 $ $Date: 2006/02/17 17:17:22 $ ";
 
 /* Hisax debug support
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/hfcscard.c 
linux-2.6.17.isdn/drivers/isdn/hisax/hfcscard.c
--- linux-2.6.17/drivers/isdn/hisax/hfcscard.c           2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfcscard.c 2006-08-21 
15:18:23.000000000 -0500
@@ -18,7 +18,7 @@
 
 extern const char *CardType[];
 
-static const char *hfcs_revision = "$Revision: 1.10.2.4 $";
+static const char hfcs_revision[] = "$Revision: 1.10.2.4 $";
 
 static irqreturn_t
 hfcs_interrupt(int intno, void *dev_id, struct pt_regs *regs)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/isdnl1.c 
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl1.c
--- linux-2.6.17/drivers/isdn/hisax/isdnl1.c             2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl1.c 2006-08-21 
15:18:23.000000000 -0500
@@ -18,7 +18,7 @@
  *
  */
 
-const char *l1_revision = "$Revision: 2.46.2.5 $";
+const char l1_revision[] = "$Revision: 2.46.2.5 $";
 
 #include <linux/init.h>
 #include "hisax.h"
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/isdnl2.c 
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl2.c
--- linux-2.6.17/drivers/isdn/hisax/isdnl2.c             2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl2.c 2006-08-21 
15:18:23.000000000 -0500
@@ -19,7 +19,7 @@
 #include "hisax.h"
 #include "isdnl2.h"
 
-const char *l2_revision = "$Revision: 2.30.2.4 $";
+const char l2_revision[] = "$Revision: 2.30.2.4 $";
 
 static void l2m_debug(struct FsmInst *fi, char *fmt, ...);
 
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/isdnl3.c 
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl3.c
--- linux-2.6.17/drivers/isdn/hisax/isdnl3.c             2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl3.c 2006-08-21 
15:18:23.000000000 -0500
@@ -19,7 +19,7 @@
 #include "hisax.h"
 #include "isdnl3.h"
 
-const char *l3_revision = "$Revision: 2.22.2.3 $";
+const char l3_revision[] = "$Revision: 2.22.2.3 $";
 
 static struct Fsm l3fsm;
 
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/isurf.c 
linux-2.6.17.isdn/drivers/isdn/hisax/isurf.c
--- linux-2.6.17/drivers/isdn/hisax/isurf.c              2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isurf.c 2006-08-21 
15:18:23.000000000 -0500
@@ -19,7 +19,7 @@
 
 extern const char *CardType[];
 
-static const char *ISurf_revision = "$Revision: 1.12.2.4 $";
+static const char ISurf_revision[] = "$Revision: 1.12.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/ix1_micro.c 
linux-2.6.17.isdn/drivers/isdn/hisax/ix1_micro.c
--- linux-2.6.17/drivers/isdn/hisax/ix1_micro.c          2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/ix1_micro.c 2006-08-21 
15:18:23.000000000 -0500
@@ -25,7 +25,7 @@
 #include "isdnl1.h"
 
 extern const char *CardType[];
-static const char *ix1_revision = "$Revision: 2.12.2.4 $";
+static const char ix1_revision[] = "$Revision: 2.12.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/l3_1tr6.c 
linux-2.6.17.isdn/drivers/isdn/hisax/l3_1tr6.c
--- linux-2.6.17/drivers/isdn/hisax/l3_1tr6.c            2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3_1tr6.c 2006-08-21 
15:18:23.000000000 -0500
@@ -19,7 +19,7 @@
 #include <linux/ctype.h>
 
 extern char *HiSax_getrev(const char *revision);
-static const char *l3_1tr6_revision = "$Revision: 2.15.2.3 $";
+static const char l3_1tr6_revision[] = "$Revision: 2.15.2.3 $";
 
 #define MsgHead(ptr, cref, mty, dis) \
                 *ptr++ = dis; \
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/l3dss1.c 
linux-2.6.17.isdn/drivers/isdn/hisax/l3dss1.c
--- linux-2.6.17/drivers/isdn/hisax/l3dss1.c             2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3dss1.c 2006-08-21 
15:18:23.000000000 -0500
@@ -25,7 +25,7 @@
 #include <linux/ctype.h>
 
 extern char *HiSax_getrev(const char *revision);
-static const char *dss1_revision = "$Revision: 2.32.2.3 $";
+static const char dss1_revision[] = "$Revision: 2.32.2.3 $";
 
 #define EXT_BEARER_CAPS 1
 
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/l3ni1.c 
linux-2.6.17.isdn/drivers/isdn/hisax/l3ni1.c
--- linux-2.6.17/drivers/isdn/hisax/l3ni1.c              2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3ni1.c 2006-08-21 
15:18:23.000000000 -0500
@@ -24,7 +24,7 @@
 #include <linux/ctype.h>
 
 extern char *HiSax_getrev(const char *revision);
-static const char *ni1_revision = "$Revision: 2.8.2.3 $";
+static const char ni1_revision[] = "$Revision: 2.8.2.3 $";
 
 #define EXT_BEARER_CAPS 1
 
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/mic.c 
linux-2.6.17.isdn/drivers/isdn/hisax/mic.c
--- linux-2.6.17/drivers/isdn/hisax/mic.c                2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/mic.c           2006-08-21 
15:18:23.000000000 -0500
@@ -18,7 +18,7 @@
 
 extern const char *CardType[];
 
-static const char *mic_revision = "$Revision: 1.12.2.4 $";
+static const char mic_revision[] = "$Revision: 1.12.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/niccy.c 
linux-2.6.17.isdn/drivers/isdn/hisax/niccy.c
--- linux-2.6.17/drivers/isdn/hisax/niccy.c              2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/niccy.c 2006-08-21 
15:18:23.000000000 -0500
@@ -23,7 +23,7 @@
 #include <linux/isapnp.h>
 
 extern const char *CardType[];
-static const char *niccy_revision = "$Revision: 1.21.2.4 $";
+static const char niccy_revision[] = "$Revision: 1.21.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/nj_s.c 
linux-2.6.17.isdn/drivers/isdn/hisax/nj_s.c
--- linux-2.6.17/drivers/isdn/hisax/nj_s.c               2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/nj_s.c          2006-08-21 
15:18:23.000000000 -0500
@@ -14,7 +14,7 @@
 #include <linux/ppp_defs.h>
 #include "netjet.h"
 
-static const char *NETjet_S_revision = "$Revision: 2.13.2.4 $";
+static const char NETjet_S_revision[] = "$Revision: 2.13.2.4 $";
 
 static u_char dummyrr(struct IsdnCardState *cs, int chan, u_char off)
 {
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/nj_u.c 
linux-2.6.17.isdn/drivers/isdn/hisax/nj_u.c
--- linux-2.6.17/drivers/isdn/hisax/nj_u.c               2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/nj_u.c          2006-08-21 
15:18:23.000000000 -0500
@@ -14,7 +14,7 @@
 #include <linux/ppp_defs.h>
 #include "netjet.h"
 
-static const char *NETjet_U_revision = "$Revision: 2.14.2.3 $";
+static const char NETjet_U_revision[] = "$Revision: 2.14.2.3 $";
 
 static u_char dummyrr(struct IsdnCardState *cs, int chan, u_char off)
 {
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/s0box.c 
linux-2.6.17.isdn/drivers/isdn/hisax/s0box.c
--- linux-2.6.17/drivers/isdn/hisax/s0box.c              2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/s0box.c 2006-08-21 
15:18:23.000000000 -0500
@@ -17,7 +17,7 @@
 #include "isdnl1.h"
 
 extern const char *CardType[];
-static const char *s0box_revision = "$Revision: 2.6.2.4 $";
+static const char s0box_revision[] = "$Revision: 2.6.2.4 $";
 
 static inline void
 writereg(unsigned int padr, signed int addr, u_char off, u_char val) {
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/sedlbauer.c 
linux-2.6.17.isdn/drivers/isdn/hisax/sedlbauer.c
--- linux-2.6.17/drivers/isdn/hisax/sedlbauer.c          2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/sedlbauer.c 2006-08-21 
15:18:23.000000000 -0500
@@ -50,7 +50,7 @@
 
 extern const char *CardType[];
 
-static const char *Sedlbauer_revision = "$Revision: 1.34.2.6 $";
+static const char Sedlbauer_revision[] = "$Revision: 1.34.2.6 $";
 
 static const char *Sedlbauer_Types[] =
                 {"None", "speed card/win", "speed star", "speed fax+",
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/sportster.c 
linux-2.6.17.isdn/drivers/isdn/hisax/sportster.c
--- linux-2.6.17/drivers/isdn/hisax/sportster.c          2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/sportster.c 2006-08-21 
15:18:23.000000000 -0500
@@ -19,7 +19,7 @@
 #include "isdnl1.h"
 
 extern const char *CardType[];
-static const char *sportster_revision = "$Revision: 1.16.2.4 $";
+static const char sportster_revision[] = "$Revision: 1.16.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/tei.c 
linux-2.6.17.isdn/drivers/isdn/hisax/tei.c
--- linux-2.6.17/drivers/isdn/hisax/tei.c                2006-06-17 
20:49:35.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/tei.c           2006-08-21 
15:18:23.000000000 -0500
@@ -20,7 +20,7 @@
 #include <linux/init.h>
 #include <linux/random.h>
 
-const char *tei_revision = "$Revision: 2.20.2.3 $";
+const char tei_revision[] = "$Revision: 2.20.2.3 $";
 
 #define ID_REQUEST              1
 #define ID_ASSIGNED             2
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/teleint.c 
linux-2.6.17.isdn/drivers/isdn/hisax/teleint.c
--- linux-2.6.17/drivers/isdn/hisax/teleint.c            2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teleint.c 2006-08-21 
15:18:23.000000000 -0500
@@ -18,7 +18,7 @@
 
 extern const char *CardType[];
 
-static const char *TeleInt_revision = "$Revision: 1.16.2.5 $";
+static const char TeleInt_revision[] = "$Revision: 1.16.2.5 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/teles0.c 
linux-2.6.17.isdn/drivers/isdn/hisax/teles0.c
--- linux-2.6.17/drivers/isdn/hisax/teles0.c             2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teles0.c 2006-08-21 
15:18:23.000000000 -0500
@@ -23,7 +23,7 @@
 
 extern const char *CardType[];
 
-static const char *teles0_revision = "$Revision: 2.15.2.4 $";
+static const char teles0_revision[] = "$Revision: 2.15.2.4 $";
 
 #define TELES_IOMEM_SIZE                0x400
 #define byteout(addr,val) outb(val,addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/teles3.c 
linux-2.6.17.isdn/drivers/isdn/hisax/teles3.c
--- linux-2.6.17/drivers/isdn/hisax/teles3.c             2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teles3.c 2006-08-21 
15:18:23.000000000 -0500
@@ -21,7 +21,7 @@
 #include "isdnl1.h"
 
 extern const char *CardType[];
-static const char *teles3_revision = "$Revision: 2.19.2.4 $";
+static const char teles3_revision[] = "$Revision: 2.19.2.4 $";
 
 #define byteout(addr,val) outb(val,addr)
 #define bytein(addr) inb(addr)
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/telespci.c 
linux-2.6.17.isdn/drivers/isdn/hisax/telespci.c
--- linux-2.6.17/drivers/isdn/hisax/telespci.c           2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/telespci.c 2006-08-21 
15:18:23.000000000 -0500
@@ -20,7 +20,7 @@
 #include <linux/pci.h>
 
 extern const char *CardType[];
-static const char *telespci_revision = "$Revision: 2.23.2.3 $";
+static const char telespci_revision[] = "$Revision: 2.23.2.3 $";
 
 #define ZORAN_PO_RQ_PEN                 0x02000000
 #define ZORAN_PO_WR             0x00800000
diff -uprN -X linux-2.6.17/Documentation/dontdiff 
linux-2.6.17/drivers/isdn/hisax/w6692.c 
linux-2.6.17.isdn/drivers/isdn/hisax/w6692.c
--- linux-2.6.17/drivers/isdn/hisax/w6692.c              2006-08-21 
12:59:06.000000000 -0500
+++ linux-2.6.17.isdn/drivers/isdn/hisax/w6692.c 2006-08-21 
15:18:23.000000000 -0500
@@ -40,7 +40,7 @@ static const PCI_ENTRY id_list[] =
 
 extern const char *CardType[];
 
-static const char *w6692_revision = "$Revision: 1.18.2.4 $";
+static const char w6692_revision[] = "$Revision: 1.18.2.4 $";
 
 #define DBUSY_TIMER_VALUE 80

------------=_1156301814-26421-520
Content-Type: text/html; charset="US-ASCII"
Content-Disposition: inline


<br><font size=2><tt>Resending so that it is in plain text format<br>
<br>
From: Janani Janakiraman &lt;janani@us.ibm.com&gt;<br>
<br>
This patch fixes the task mentioned in the Kernel Janitors TODO list (by
Jeff Garzik) for the drivers/isdn/hisax directory in Linux Kernel Version
2.6.17 with patch patch-2.6.18-rc4 applied. <br>
<br>
1) The string form<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;[const] char *foo = &quot;blah&quot;;<br>
<br>
creates two variables in the final assembly output, a static string, and<br>
a char pointer to the static string. &nbsp;The alternate string form<br>
<br>
 &nbsp; &nbsp; &nbsp; &nbsp;[const] char foo[] = &quot;blah&quot;;<br>
<br>
is better because it declares a single variable.<br>
<br>
For variables marked __initdata, the &quot;*foo&quot; form causes only
the<br>
pointer, not the string itself, to be dropped from the kernel image,<br>
which is a bug. &nbsp;Using the &quot;foo[]&quot; form with regular 'ole
local<br>
variables also makes the assembly shorter.<br>
<br>
Signed-off-by: Janani Janakiraman (janani@us.ibm.com)<br>
-----------------------------------------------------------------------------<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/asuscom.c
linux-2.6.17.isdn/drivers/isdn/hisax/asuscom.c<br>
--- linux-2.6.17/drivers/isdn/hisax/asuscom.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/asuscom.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -22,7 +22,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *Asuscom_revision = &quot;$Revision: 1.14.2.4 $&quot;;<br>
+static const char Asuscom_revision[] = &quot;$Revision: 1.14.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/avm_a1p.c
linux-2.6.17.isdn/drivers/isdn/hisax/avm_a1p.c<br>
--- linux-2.6.17/drivers/isdn/hisax/avm_a1p.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/avm_a1p.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -56,7 +56,7 @@<br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
 <br>
-static const char *avm_revision = &quot;$Revision: 2.9.2.5 $&quot;;<br>
+static const char avm_revision[] = &quot;$Revision: 2.9.2.5 $&quot;;<br>
 <br>
 static inline u_char<br>
 ReadISAC(struct IsdnCardState *cs, u_char offset)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/avm_pci.c
linux-2.6.17.isdn/drivers/isdn/hisax/avm_pci.c<br>
--- linux-2.6.17/drivers/isdn/hisax/avm_pci.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/avm_pci.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -21,7 +21,7 @@<br>
 #include &lt;linux/interrupt.h&gt;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *avm_pci_rev = &quot;$Revision: 1.29.2.4 $&quot;;<br>
+static const char avm_pci_rev[] = &quot;$Revision: 1.29.2.4 $&quot;;<br>
 <br>
 #define &nbsp;AVM_FRITZ_PCI &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;1<br>
 #define &nbsp;AVM_FRITZ_PNP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;2<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/bkm_a4t.c
linux-2.6.17.isdn/drivers/isdn/hisax/bkm_a4t.c<br>
--- linux-2.6.17/drivers/isdn/hisax/bkm_a4t.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/bkm_a4t.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -22,7 +22,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *bkm_a4t_revision = &quot;$Revision: 1.22.2.4 $&quot;;<br>
+static const char bkm_a4t_revision[] = &quot;$Revision: 1.22.2.4 $&quot;;<br>
 <br>
 <br>
 static inline u_char<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/callc.c
linux-2.6.17.isdn/drivers/isdn/hisax/callc.c<br>
--- linux-2.6.17/drivers/isdn/hisax/callc.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/callc.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -21,7 +21,7 @@<br>
 #include &quot;hisax.h&quot;<br>
 #include &lt;linux/isdn/capicmd.h&gt;<br>
 <br>
-const char *lli_revision = &quot;$Revision: 2.59.2.4 $&quot;;<br>
+const char lli_revision[] = &quot;$Revision: 2.59.2.4 $&quot;;<br>
 <br>
 extern struct IsdnCard cards[];<br>
 extern int nrcards;<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/diva.c
linux-2.6.17.isdn/drivers/isdn/hisax/diva.c<br>
--- linux-2.6.17/drivers/isdn/hisax/diva.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/diva.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -27,7 +27,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *Diva_revision = &quot;$Revision: 1.33.2.6 $&quot;;<br>
+static const char Diva_revision[] = &quot;$Revision: 1.33.2.6 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/elsa.c
linux-2.6.17.isdn/drivers/isdn/hisax/elsa.c<br>
--- linux-2.6.17/drivers/isdn/hisax/elsa.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/elsa.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -32,7 +32,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *Elsa_revision = &quot;$Revision: 2.32.2.4 $&quot;;<br>
+static const char Elsa_revision[] = &quot;$Revision: 2.32.2.4 $&quot;;<br>
 static const char *Elsa_Types[] =<br>
 {&quot;None&quot;, &quot;PC&quot;, &quot;PCC-8&quot;, &quot;PCC-16&quot;,
&quot;PCF&quot;, &quot;PCF-Pro&quot;,<br>
 &nbsp;&quot;PCMCIA&quot;, &quot;QS 1000&quot;, &quot;QS 3000&quot;, &quot;Microlink
PCI&quot;, &quot;QS 3000 PCI&quot;, <br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/enternow_pci.c
linux-2.6.17.isdn/drivers/isdn/hisax/enternow_pci.c<br>
--- linux-2.6.17/drivers/isdn/hisax/enternow_pci.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000
-0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/enternow_pci.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -72,7 +72,7 @@<br>
 <br>
 <br>
 <br>
-static const char *enternow_pci_rev = &quot;$Revision: 1.1.4.5 $&quot;;<br>
+static const char enternow_pci_rev[] = &quot;$Revision: 1.1.4.5 $&quot;;<br>
 <br>
 <br>
 /* f?r PowerISDN PCI */<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/gazel.c
linux-2.6.17.isdn/drivers/isdn/hisax/gazel.c<br>
--- linux-2.6.17/drivers/isdn/hisax/gazel.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/gazel.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -20,7 +20,7 @@<br>
 #include &lt;linux/pci.h&gt;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *gazel_revision = &quot;$Revision: 2.19.2.4 $&quot;;<br>
+static const char gazel_revision[] = &quot;$Revision: 2.19.2.4 $&quot;;<br>
 <br>
 #define R647 &nbsp; &nbsp; &nbsp;1<br>
 #define R685 &nbsp; &nbsp; &nbsp;2<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/hfc_pci.c
linux-2.6.17.isdn/drivers/isdn/hisax/hfc_pci.c<br>
--- linux-2.6.17/drivers/isdn/hisax/hfc_pci.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfc_pci.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -24,7 +24,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *hfcpci_revision = &quot;$Revision: 1.48.2.4 $&quot;;<br>
+static const char hfcpci_revision[] = &quot;$Revision: 1.48.2.4 $&quot;;<br>
 <br>
 /* table entry in the PCI devices list */<br>
 typedef struct {<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/hfc_usb.c
linux-2.6.17.isdn/drivers/isdn/hisax/hfc_usb.c<br>
--- linux-2.6.17/drivers/isdn/hisax/hfc_usb.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfc_usb.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -43,7 +43,7 @@<br>
 #include &quot;hisax_if.h&quot;<br>
 #include &quot;hfc_usb.h&quot;<br>
 <br>
-static const char *hfcusb_revision =<br>
+static const char hfcusb_revision[] =<br>
 &nbsp; &nbsp; &quot;$Revision: 2.3.2.13 $ $Date: 2006/02/17 17:17:22 $
&quot;;<br>
 <br>
 /* Hisax debug support<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/hfcscard.c
linux-2.6.17.isdn/drivers/isdn/hisax/hfcscard.c<br>
--- linux-2.6.17/drivers/isdn/hisax/hfcscard.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/hfcscard.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -18,7 +18,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *hfcs_revision = &quot;$Revision: 1.10.2.4 $&quot;;<br>
+static const char hfcs_revision[] = &quot;$Revision: 1.10.2.4 $&quot;;<br>
 <br>
 static irqreturn_t<br>
 hfcs_interrupt(int intno, void *dev_id, struct pt_regs *regs)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/isdnl1.c
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl1.c<br>
--- linux-2.6.17/drivers/isdn/hisax/isdnl1.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl1.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -18,7 +18,7 @@<br>
 &nbsp;*<br>
 &nbsp;*/<br>
 <br>
-const char *l1_revision = &quot;$Revision: 2.46.2.5 $&quot;;<br>
+const char l1_revision[] = &quot;$Revision: 2.46.2.5 $&quot;;<br>
 <br>
 #include &lt;linux/init.h&gt;<br>
 #include &quot;hisax.h&quot;<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/isdnl2.c
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl2.c<br>
--- linux-2.6.17/drivers/isdn/hisax/isdnl2.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl2.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -19,7 +19,7 @@<br>
 #include &quot;hisax.h&quot;<br>
 #include &quot;isdnl2.h&quot;<br>
 <br>
-const char *l2_revision = &quot;$Revision: 2.30.2.4 $&quot;;<br>
+const char l2_revision[] = &quot;$Revision: 2.30.2.4 $&quot;;<br>
 <br>
 static void l2m_debug(struct FsmInst *fi, char *fmt, ...);<br>
 <br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/isdnl3.c
linux-2.6.17.isdn/drivers/isdn/hisax/isdnl3.c<br>
--- linux-2.6.17/drivers/isdn/hisax/isdnl3.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isdnl3.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -19,7 +19,7 @@<br>
 #include &quot;hisax.h&quot;<br>
 #include &quot;isdnl3.h&quot;<br>
 <br>
-const char *l3_revision = &quot;$Revision: 2.22.2.3 $&quot;;<br>
+const char l3_revision[] = &quot;$Revision: 2.22.2.3 $&quot;;<br>
 <br>
 static struct Fsm l3fsm;<br>
 <br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/isurf.c
linux-2.6.17.isdn/drivers/isdn/hisax/isurf.c<br>
--- linux-2.6.17/drivers/isdn/hisax/isurf.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/isurf.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -19,7 +19,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *ISurf_revision = &quot;$Revision: 1.12.2.4 $&quot;;<br>
+static const char ISurf_revision[] = &quot;$Revision: 1.12.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/ix1_micro.c
linux-2.6.17.isdn/drivers/isdn/hisax/ix1_micro.c<br>
--- linux-2.6.17/drivers/isdn/hisax/ix1_micro.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/ix1_micro.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -25,7 +25,7 @@<br>
 #include &quot;isdnl1.h&quot;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *ix1_revision = &quot;$Revision: 2.12.2.4 $&quot;;<br>
+static const char ix1_revision[] = &quot;$Revision: 2.12.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/l3_1tr6.c
linux-2.6.17.isdn/drivers/isdn/hisax/l3_1tr6.c<br>
--- linux-2.6.17/drivers/isdn/hisax/l3_1tr6.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3_1tr6.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -19,7 +19,7 @@<br>
 #include &lt;linux/ctype.h&gt;<br>
 <br>
 extern char *HiSax_getrev(const char *revision);<br>
-static const char *l3_1tr6_revision = &quot;$Revision: 2.15.2.3 $&quot;;<br>
+static const char l3_1tr6_revision[] = &quot;$Revision: 2.15.2.3 $&quot;;<br>
 <br>
 #define MsgHead(ptr, cref, mty, dis) \<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*ptr++
= dis; \<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/l3dss1.c
linux-2.6.17.isdn/drivers/isdn/hisax/l3dss1.c<br>
--- linux-2.6.17/drivers/isdn/hisax/l3dss1.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3dss1.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -25,7 +25,7 @@<br>
 #include &lt;linux/ctype.h&gt;<br>
 <br>
 extern char *HiSax_getrev(const char *revision);<br>
-static const char *dss1_revision = &quot;$Revision: 2.32.2.3 $&quot;;<br>
+static const char dss1_revision[] = &quot;$Revision: 2.32.2.3 $&quot;;<br>
 <br>
 #define EXT_BEARER_CAPS 1<br>
 <br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/l3ni1.c
linux-2.6.17.isdn/drivers/isdn/hisax/l3ni1.c<br>
--- linux-2.6.17/drivers/isdn/hisax/l3ni1.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/l3ni1.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -24,7 +24,7 @@<br>
 #include &lt;linux/ctype.h&gt;<br>
 <br>
 extern char *HiSax_getrev(const char *revision);<br>
-static const char *ni1_revision = &quot;$Revision: 2.8.2.3 $&quot;;<br>
+static const char ni1_revision[] = &quot;$Revision: 2.8.2.3 $&quot;;<br>
 <br>
 #define EXT_BEARER_CAPS 1<br>
 <br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/mic.c
linux-2.6.17.isdn/drivers/isdn/hisax/mic.c<br>
--- linux-2.6.17/drivers/isdn/hisax/mic.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/mic.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -18,7 +18,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *mic_revision = &quot;$Revision: 1.12.2.4 $&quot;;<br>
+static const char mic_revision[] = &quot;$Revision: 1.12.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/niccy.c
linux-2.6.17.isdn/drivers/isdn/hisax/niccy.c<br>
--- linux-2.6.17/drivers/isdn/hisax/niccy.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/niccy.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -23,7 +23,7 @@<br>
 #include &lt;linux/isapnp.h&gt;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *niccy_revision = &quot;$Revision: 1.21.2.4 $&quot;;<br>
+static const char niccy_revision[] = &quot;$Revision: 1.21.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/nj_s.c
linux-2.6.17.isdn/drivers/isdn/hisax/nj_s.c<br>
--- linux-2.6.17/drivers/isdn/hisax/nj_s.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/nj_s.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -14,7 +14,7 @@<br>
 #include &lt;linux/ppp_defs.h&gt;<br>
 #include &quot;netjet.h&quot;<br>
 <br>
-static const char *NETjet_S_revision = &quot;$Revision: 2.13.2.4 $&quot;;<br>
+static const char NETjet_S_revision[] = &quot;$Revision: 2.13.2.4 $&quot;;<br>
 <br>
 static u_char dummyrr(struct IsdnCardState *cs, int chan, u_char off)<br>
 {<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/nj_u.c
linux-2.6.17.isdn/drivers/isdn/hisax/nj_u.c<br>
--- linux-2.6.17/drivers/isdn/hisax/nj_u.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/nj_u.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -14,7 +14,7 @@<br>
 #include &lt;linux/ppp_defs.h&gt;<br>
 #include &quot;netjet.h&quot;<br>
 <br>
-static const char *NETjet_U_revision = &quot;$Revision: 2.14.2.3 $&quot;;<br>
+static const char NETjet_U_revision[] = &quot;$Revision: 2.14.2.3 $&quot;;<br>
 <br>
 static u_char dummyrr(struct IsdnCardState *cs, int chan, u_char off)<br>
 {<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/s0box.c
linux-2.6.17.isdn/drivers/isdn/hisax/s0box.c<br>
--- linux-2.6.17/drivers/isdn/hisax/s0box.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/s0box.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -17,7 +17,7 @@<br>
 #include &quot;isdnl1.h&quot;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *s0box_revision = &quot;$Revision: 2.6.2.4 $&quot;;<br>
+static const char s0box_revision[] = &quot;$Revision: 2.6.2.4 $&quot;;<br>
 <br>
 static inline void<br>
 writereg(unsigned int padr, signed int addr, u_char off, u_char val) {<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/sedlbauer.c
linux-2.6.17.isdn/drivers/isdn/hisax/sedlbauer.c<br>
--- linux-2.6.17/drivers/isdn/hisax/sedlbauer.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/sedlbauer.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -50,7 +50,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *Sedlbauer_revision = &quot;$Revision: 1.34.2.6 $&quot;;<br>
+static const char Sedlbauer_revision[] = &quot;$Revision: 1.34.2.6 $&quot;;<br>
 <br>
 static const char *Sedlbauer_Types[] =<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{&quot;None&quot;,
&quot;speed card/win&quot;, &quot;speed star&quot;, &quot;speed fax+&quot;,<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/sportster.c
linux-2.6.17.isdn/drivers/isdn/hisax/sportster.c<br>
--- linux-2.6.17/drivers/isdn/hisax/sportster.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/sportster.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -19,7 +19,7 @@<br>
 #include &quot;isdnl1.h&quot;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *sportster_revision = &quot;$Revision: 1.16.2.4 $&quot;;<br>
+static const char sportster_revision[] = &quot;$Revision: 1.16.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/tei.c
linux-2.6.17.isdn/drivers/isdn/hisax/tei.c<br>
--- linux-2.6.17/drivers/isdn/hisax/tei.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-06-17 20:49:35.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/tei.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -20,7 +20,7 @@<br>
 #include &lt;linux/init.h&gt;<br>
 #include &lt;linux/random.h&gt;<br>
 <br>
-const char *tei_revision = &quot;$Revision: 2.20.2.3 $&quot;;<br>
+const char tei_revision[] = &quot;$Revision: 2.20.2.3 $&quot;;<br>
 <br>
 #define ID_REQUEST &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; 1<br>
 #define ID_ASSIGNED &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 2<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/teleint.c
linux-2.6.17.isdn/drivers/isdn/hisax/teleint.c<br>
--- linux-2.6.17/drivers/isdn/hisax/teleint.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teleint.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -18,7 +18,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *TeleInt_revision = &quot;$Revision: 1.16.2.5 $&quot;;<br>
+static const char TeleInt_revision[] = &quot;$Revision: 1.16.2.5 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/teles0.c
linux-2.6.17.isdn/drivers/isdn/hisax/teles0.c<br>
--- linux-2.6.17/drivers/isdn/hisax/teles0.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teles0.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -23,7 +23,7 @@<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *teles0_revision = &quot;$Revision: 2.15.2.4 $&quot;;<br>
+static const char teles0_revision[] = &quot;$Revision: 2.15.2.4 $&quot;;<br>
 <br>
 #define TELES_IOMEM_SIZE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0x400<br>
 #define byteout(addr,val) outb(val,addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/teles3.c
linux-2.6.17.isdn/drivers/isdn/hisax/teles3.c<br>
--- linux-2.6.17/drivers/isdn/hisax/teles3.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/teles3.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -21,7 +21,7 @@<br>
 #include &quot;isdnl1.h&quot;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *teles3_revision = &quot;$Revision: 2.19.2.4 $&quot;;<br>
+static const char teles3_revision[] = &quot;$Revision: 2.19.2.4 $&quot;;<br>
 <br>
 #define byteout(addr,val) outb(val,addr)<br>
 #define bytein(addr) inb(addr)<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/telespci.c
linux-2.6.17.isdn/drivers/isdn/hisax/telespci.c<br>
--- linux-2.6.17/drivers/isdn/hisax/telespci.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/telespci.c &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000
-0500<br>
@@ -20,7 +20,7 @@<br>
 #include &lt;linux/pci.h&gt;<br>
 <br>
 extern const char *CardType[];<br>
-static const char *telespci_revision = &quot;$Revision: 2.23.2.3 $&quot;;<br>
+static const char telespci_revision[] = &quot;$Revision: 2.23.2.3 $&quot;;<br>
 <br>
 #define ZORAN_PO_RQ_PEN &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0x02000000<br>
 #define ZORAN_PO_WR &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0x00800000<br>
diff -uprN -X linux-2.6.17/Documentation/dontdiff linux-2.6.17/drivers/isdn/hisax/w6692.c
linux-2.6.17.isdn/drivers/isdn/hisax/w6692.c<br>
--- linux-2.6.17/drivers/isdn/hisax/w6692.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 12:59:06.000000000 -0500<br>
+++ linux-2.6.17.isdn/drivers/isdn/hisax/w6692.c &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; 2006-08-21 15:18:23.000000000 -0500<br>
@@ -40,7 +40,7 @@ static const PCI_ENTRY id_list[] =<br>
 <br>
 extern const char *CardType[];<br>
 <br>
-static const char *w6692_revision = &quot;$Revision: 1.18.2.4 $&quot;;<br>
+static const char w6692_revision[] = &quot;$Revision: 1.18.2.4 $&quot;;<br>
 <br>
 #define DBUSY_TIMER_VALUE 80</tt></font>
<br>
------------=_1156301814-26421-520--

--===============0201184549==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0201184549==--
