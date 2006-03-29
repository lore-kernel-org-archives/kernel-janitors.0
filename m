From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 29 Mar 2006 19:58:09 +0000
Subject: [KJ] [PATCH] drivers/char/[i]stallion: Clean up kmalloc usage
Message-Id: <20060329195126.GC1127@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89864231675463779=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89864231675463779==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Delete two useless kmalloc wrappers and use kmalloc/kzalloc. Some weird NULL
checks are also simplified. Compile tested on i386

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 drivers/char/istallion.c |   32 +++++++++-----------------------
 drivers/char/stallion.c  |   46 +++++++++++++++-------------------------------
 2 files changed, 24 insertions(+), 54 deletions(-)

diff -urpN -X dontdiff linux-2.6.16/drivers/char/istallion.c linux-2.6.16~tk/drivers/char/istallion.c
--- linux-2.6.16/drivers/char/istallion.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.16~tk/drivers/char/istallion.c	2006-03-29 20:32:10.000000000 +0200
@@ -707,7 +707,6 @@ static int	stli_portcmdstats(stliport_t 
 static int	stli_clrportstats(stliport_t *portp, comstats_t __user *cp);
 static int	stli_getportstruct(stliport_t __user *arg);
 static int	stli_getbrdstruct(stlibrd_t __user *arg);
-static void	*stli_memalloc(int len);
 static stlibrd_t *stli_allocbrd(void);
 
 static void	stli_ecpinit(stlibrd_t *brdp);
@@ -998,17 +997,6 @@ static int stli_parsebrd(stlconf_t *conf
 
 /*****************************************************************************/
 
-/*
- *	Local driver kernel malloc routine.
- */
-
-static void *stli_memalloc(int len)
-{
-	return((void *) kmalloc(len, GFP_KERNEL));
-}
-
-/*****************************************************************************/
-
 static int stli_open(struct tty_struct *tty, struct file *filp)
 {
 	stlibrd_t	*brdp;
@@ -3228,13 +3216,12 @@ static int stli_initports(stlibrd_t *brd
 #endif
 
 	for (i = 0, panelnr = 0, panelport = 0; (i < brdp->nrports); i++) {
-		portp = (stliport_t *) stli_memalloc(sizeof(stliport_t));
-		if (portp == (stliport_t *) NULL) {
+		portp = kzalloc(sizeof(stliport_t), GFP_KERNEL);
+		if (!portp) {
 			printk("STALLION: failed to allocate port structure\n");
 			continue;
 		}
 
-		memset(portp, 0, sizeof(stliport_t));
 		portp->magic = STLI_PORTMAGIC;
 		portp->portnr = i;
 		portp->brdnr = brdp->brdnr;
@@ -4611,14 +4598,13 @@ static stlibrd_t *stli_allocbrd(void)
 {
 	stlibrd_t	*brdp;
 
-	brdp = (stlibrd_t *) stli_memalloc(sizeof(stlibrd_t));
-	if (brdp == (stlibrd_t *) NULL) {
+	brdp = kzalloc(sizeof(stlibrd_t), GFP_KERNEL);
+	if (!brdp) {
 		printk(KERN_ERR "STALLION: failed to allocate memory "
 				"(size=%d)\n", sizeof(stlibrd_t));
-		return((stlibrd_t *) NULL);
+		return NULL;
 	}
 
-	memset(brdp, 0, sizeof(stlibrd_t));
 	brdp->magic = STLI_BOARDMAGIC;
 	return(brdp);
 }
@@ -5211,12 +5197,12 @@ int __init stli_init(void)
 /*
  *	Allocate a temporary write buffer.
  */
-	stli_tmpwritebuf = (char *) stli_memalloc(STLI_TXBUFSIZE);
-	if (stli_tmpwritebuf == (char *) NULL)
+	stli_tmpwritebuf = kmalloc(STLI_TXBUFSIZE, GFP_KERNEL);
+	if (!stli_tmpwritebuf)
 		printk(KERN_ERR "STALLION: failed to allocate memory "
 				"(size=%d)\n", STLI_TXBUFSIZE);
-	stli_txcookbuf = stli_memalloc(STLI_TXBUFSIZE);
-	if (stli_txcookbuf == (char *) NULL)
+	stli_txcookbuf = kmalloc(STLI_TXBUFSIZE, GFP_KERNEL);
+	if (!stli_txcookbuf)
 		printk(KERN_ERR "STALLION: failed to allocate memory "
 				"(size=%d)\n", STLI_TXBUFSIZE);
 
diff -urpN -X dontdiff linux-2.6.16/drivers/char/stallion.c linux-2.6.16~tk/drivers/char/stallion.c
--- linux-2.6.16/drivers/char/stallion.c	2006-03-20 20:26:45.000000000 +0100
+++ linux-2.6.16~tk/drivers/char/stallion.c	2006-03-29 20:53:18.000000000 +0200
@@ -505,7 +505,6 @@ static int	stl_echmcaintr(stlbrd_t *brdp
 static int	stl_echpciintr(stlbrd_t *brdp);
 static int	stl_echpci64intr(stlbrd_t *brdp);
 static void	stl_offintr(void *private);
-static void	*stl_memalloc(int len);
 static stlbrd_t *stl_allocbrd(void);
 static stlport_t *stl_getport(int brdnr, int panelnr, int portnr);
 
@@ -941,17 +940,6 @@ static int stl_parsebrd(stlconf_t *confp
 /*****************************************************************************/
 
 /*
- *	Local driver kernel memory allocation routine.
- */
-
-static void *stl_memalloc(int len)
-{
-	return (void *) kmalloc(len, GFP_KERNEL);
-}
-
-/*****************************************************************************/
-
-/*
  *	Allocate a new board structure. Fill out the basic info in it.
  */
 
@@ -959,14 +947,13 @@ static stlbrd_t *stl_allocbrd(void)
 {
 	stlbrd_t	*brdp;
 
-	brdp = (stlbrd_t *) stl_memalloc(sizeof(stlbrd_t));
-	if (brdp == (stlbrd_t *) NULL) {
+	brdp = kzalloc(sizeof(stlbrd_t), GFP_KERNEL);
+	if (!brdp) {
 		printk("STALLION: failed to allocate memory (size=%d)\n",
 			sizeof(stlbrd_t));
-		return (stlbrd_t *) NULL;
+		return NULL;
 	}
 
-	memset(brdp, 0, sizeof(stlbrd_t));
 	brdp->magic = STL_BOARDMAGIC;
 	return brdp;
 }
@@ -1018,9 +1005,9 @@ static int stl_open(struct tty_struct *t
 	portp->refcount++;
 
 	if ((portp->flags & ASYNC_INITIALIZED) == 0) {
-		if (portp->tx.buf == (char *) NULL) {
-			portp->tx.buf = (char *) stl_memalloc(STL_TXBUFSIZE);
-			if (portp->tx.buf == (char *) NULL)
+		if (!portp->tx.buf) {
+			portp->tx.buf = kmalloc(STL_TXBUFSIZE, GFP_KERNEL);
+			if (!portp->tx.buf)
 				return -ENOMEM;
 			portp->tx.head = portp->tx.buf;
 			portp->tx.tail = portp->tx.buf;
@@ -2179,13 +2166,12 @@ static int __init stl_initports(stlbrd_t
  *	each ports data structures.
  */
 	for (i = 0; (i < panelp->nrports); i++) {
-		portp = (stlport_t *) stl_memalloc(sizeof(stlport_t));
-		if (portp == (stlport_t *) NULL) {
+		portp = kzalloc(sizeof(stlport_t), GFP_KERNEL);
+		if (!portp) {
 			printk("STALLION: failed to allocate memory "
 				"(size=%d)\n", sizeof(stlport_t));
 			break;
 		}
-		memset(portp, 0, sizeof(stlport_t));
 
 		portp->magic = STL_PORTMAGIC;
 		portp->portnr = i;
@@ -2316,13 +2302,12 @@ static inline int stl_initeio(stlbrd_t *
  *	can complete the setup.
  */
 
-	panelp = (stlpanel_t *) stl_memalloc(sizeof(stlpanel_t));
-	if (panelp == (stlpanel_t *) NULL) {
+	panelp = kzalloc(sizeof(stlpanel_t), GFP_KERNEL);
+	if (!panelp) {
 		printk(KERN_WARNING "STALLION: failed to allocate memory "
 			"(size=%d)\n", sizeof(stlpanel_t));
-		return(-ENOMEM);
+		return -ENOMEM;
 	}
-	memset(panelp, 0, sizeof(stlpanel_t));
 
 	panelp->magic = STL_PANELMAGIC;
 	panelp->brdnr = brdp->brdnr;
@@ -2491,13 +2476,12 @@ static inline int stl_initech(stlbrd_t *
 		status = inb(ioaddr + ECH_PNLSTATUS);
 		if ((status & ECH_PNLIDMASK) != nxtid)
 			break;
-		panelp = (stlpanel_t *) stl_memalloc(sizeof(stlpanel_t));
-		if (panelp == (stlpanel_t *) NULL) {
+		panelp = kzalloc(sizeof(stlpanel_t), GFP_KERNEL);
+		if (!panelp) {
 			printk("STALLION: failed to allocate memory "
 				"(size=%d)\n", sizeof(stlpanel_t));
 			break;
 		}
-		memset(panelp, 0, sizeof(stlpanel_t));
 		panelp->magic = STL_PANELMAGIC;
 		panelp->brdnr = brdp->brdnr;
 		panelp->panelnr = panelnr;
@@ -3075,8 +3059,8 @@ static int __init stl_init(void)
 /*
  *	Allocate a temporary write buffer.
  */
-	stl_tmpwritebuf = (char *) stl_memalloc(STL_TXBUFSIZE);
-	if (stl_tmpwritebuf == (char *) NULL)
+	stl_tmpwritebuf = kmalloc(STL_TXBUFSIZE, GFP_KERNEL);
+	if (!stl_tmpwritebuf)
 		printk("STALLION: failed to allocate memory (size=%d)\n",
 			STL_TXBUFSIZE);
 

--===============89864231675463779==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89864231675463779==--
