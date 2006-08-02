From: =?iso-8859-15?Q?Cl=E9ment?= Stenac <zorglub@diwi.org>
Date: Wed, 02 Aug 2006 19:57:31 +0000
Subject: Re: [KJ] [PATCH] Use standard min/max macros [3/3]
Message-Id: <20060802195731.GA1197@diwi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060731221329.GA31140@diwi.org>
In-Reply-To: <20060731221329.GA31140@diwi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Remove some custom type-unsafe MIN/MAX macros in favor of type-checking
min/max from kernel.h

Signed-off-by: Cl=E9ment Stenac <zorglub@diwi.org>
---
This version removes the ACPI part so as to keep it totally
OS-independent.

Should I copy the macro itself or just let it as such ?

diff --git a/drivers/char/istallion.c b/drivers/char/istallion.c
index 84dfc42..15cd662 100644
--- a/drivers/char/istallion.c
+++ b/drivers/char/istallion.c
@@ -627,8 +627,6 @@ static unsigned int	stli_baudrates[] =3D {
 /*
  *	Define some handy local macros...
  */
-#undef MIN
-#define	MIN(a,b)	(((a) <=3D (b)) ? (a) : (b))
=20
 #undef	TOLOWER
 #define	TOLOWER(x)	((((x) >=3D 'A') && ((x) <=3D 'Z')) ? ((x) + 0x20) : (x=
))
@@ -1455,12 +1453,12 @@ static int stli_write(struct tty_struct=20
 		stlen =3D len;
 	}
=20
-	len =3D MIN(len, count);
+	len =3D min(len, count);
 	count =3D 0;
 	shbuf =3D (char __iomem *) EBRDGETMEMPTR(brdp, portp->txoffset);
=20
 	while (len > 0) {
-		stlen =3D MIN(len, stlen);
+		stlen =3D min(len, stlen);
 		memcpy_toio(shbuf + head, chbuf, stlen);
 		chbuf +=3D stlen;
 		len -=3D stlen;
@@ -1574,13 +1572,13 @@ static void stli_flushchars(struct tty_s
 		stlen =3D len;
 	}
=20
-	len =3D MIN(len, cooksize);
+	len =3D min(len, cooksize);
 	count =3D 0;
 	shbuf =3D (char *) EBRDGETMEMPTR(brdp, portp->txoffset);
 	buf =3D stli_txcookbuf;
=20
 	while (len > 0) {
-		stlen =3D MIN(len, stlen);
+		stlen =3D min(len, stlen);
 		memcpy_toio(shbuf + head, buf, stlen);
 		buf +=3D stlen;
 		len -=3D stlen;
@@ -2416,7 +2414,7 @@ static void stli_read(stlibrd_t *brdp, s
 	while (len > 0) {
 		unsigned char *cptr;
=20
-		stlen =3D MIN(len, stlen);
+		stlen =3D min(len, stlen);
 		tty_prepare_flip_string(tty, &cptr, stlen);
 		memcpy_fromio(cptr, shbuf + tail, stlen);
 		len -=3D stlen;
@@ -4219,7 +4217,7 @@ static ssize_t stli_memread(struct file=20
 	if (off >=3D brdp->memsize || off + count < off)
 		return 0;
=20
-	size =3D MIN(count, (brdp->memsize - off));
+	size =3D min(count, (brdp->memsize - off));
=20
 	/*
 	 *	Copy the data a page at a time
@@ -4233,8 +4231,8 @@ static ssize_t stli_memread(struct file=20
 		spin_lock_irqsave(&brd_lock, flags);
 		EBRDENABLE(brdp);
 		memptr =3D (void *) EBRDGETMEMPTR(brdp, off);
-		n =3D MIN(size, (brdp->pagesize - (((unsigned long) off) % brdp->pagesiz=
e)));
-		n =3D MIN(n, PAGE_SIZE);
+		n =3D min(size, (brdp->pagesize - (((unsigned long) off) % brdp->pagesiz=
e)));
+		n =3D min(n, PAGE_SIZE);
 		memcpy_fromio(p, memptr, n);
 		EBRDDISABLE(brdp);
 		spin_unlock_irqrestore(&brd_lock, flags);
@@ -4285,7 +4283,7 @@ static ssize_t stli_memwrite(struct file
 		return 0;
=20
 	chbuf =3D (char __user *) buf;
-	size =3D MIN(count, (brdp->memsize - off));
+	size =3D min(count, (brdp->memsize - off));
=20
 	/*
 	 *	Copy the data a page at a time
@@ -4296,8 +4294,8 @@ static ssize_t stli_memwrite(struct file
 		return -ENOMEM;
=20
 	while (size > 0) {
-		n =3D MIN(size, (brdp->pagesize - (((unsigned long) off) % brdp->pagesiz=
e)));
-		n =3D MIN(n, PAGE_SIZE);
+		n =3D min(size, (brdp->pagesize - (((unsigned long) off) % brdp->pagesiz=
e)));
+		n =3D min(n, PAGE_SIZE);
 		if (copy_from_user(p, chbuf, n)) {
 			if (count =3D 0)
 				count =3D -EFAULT;
diff --git a/drivers/char/stallion.c b/drivers/char/stallion.c
index 3beb220..2e3a326 100644
--- a/drivers/char/stallion.c
+++ b/drivers/char/stallion.c
@@ -445,9 +445,6 @@ static unsigned int	stl_baudrates[] =3D {
 /*
  *	Define some handy local macros...
  */
-#undef	MIN
-#define	MIN(a,b)	(((a) <=3D (b)) ? (a) : (b))
-
 #undef	TOLOWER
 #define	TOLOWER(x)	((((x) >=3D 'A') && ((x) <=3D 'Z')) ? ((x) + 0x20) : (x=
))
=20
@@ -1201,10 +1198,10 @@ #endif
 		stlen =3D len;
 	}
=20
-	len =3D MIN(len, count);
+	len =3D min(len, count);
 	count =3D 0;
 	while (len > 0) {
-		stlen =3D MIN(len, stlen);
+		stlen =3D min(len, stlen);
 		memcpy(head, chbuf, stlen);
 		len -=3D stlen;
 		chbuf +=3D stlen;
@@ -3936,9 +3933,9 @@ #endif
 		}
 		outb(srer, (ioaddr + EREG_DATA));
 	} else {
-		len =3D MIN(len, CD1400_TXFIFOSIZE);
+		len =3D min(len, CD1400_TXFIFOSIZE);
 		portp->stats.txtotal +=3D len;
-		stlen =3D MIN(len, ((portp->tx.buf + STL_TXBUFSIZE) - tail));
+		stlen =3D min(len, ((portp->tx.buf + STL_TXBUFSIZE) - tail));
 		outb((TDR + portp->uartaddr), ioaddr);
 		outsb((ioaddr + EREG_DATA), tail, stlen);
 		len -=3D stlen;
@@ -3993,13 +3990,13 @@ #endif
 		outb((RDCR + portp->uartaddr), ioaddr);
 		len =3D inb(ioaddr + EREG_DATA);
 		if (tty =3D NULL || (buflen =3D tty_buffer_request_room(tty, len)) =3D 0=
) {
-			len =3D MIN(len, sizeof(stl_unwanted));
+			len =3D min(len, sizeof(stl_unwanted));
 			outb((RDSR + portp->uartaddr), ioaddr);
 			insb((ioaddr + EREG_DATA), &stl_unwanted[0], len);
 			portp->stats.rxlost +=3D len;
 			portp->stats.rxtotal +=3D len;
 		} else {
-			len =3D MIN(len, buflen);
+			len =3D min(len, buflen);
 			if (len > 0) {
 				unsigned char *ptr;
 				outb((RDSR + portp->uartaddr), ioaddr);
@@ -4897,9 +4894,9 @@ #endif
 			outb(mr0, (ioaddr + XP_DATA));
 		}
 	} else {
-		len =3D MIN(len, SC26198_TXFIFOSIZE);
+		len =3D min(len, SC26198_TXFIFOSIZE);
 		portp->stats.txtotal +=3D len;
-		stlen =3D MIN(len, ((portp->tx.buf + STL_TXBUFSIZE) - tail));
+		stlen =3D min(len, ((portp->tx.buf + STL_TXBUFSIZE) - tail));
 		outb(GTXFIFO, (ioaddr + XP_ADDR));
 		outsb((ioaddr + XP_DATA), tail, stlen);
 		len -=3D stlen;
@@ -4942,13 +4939,13 @@ #endif
=20
 	if ((iack & IVR_TYPEMASK) =3D IVR_RXDATA) {
 		if (tty =3D NULL || (buflen =3D tty_buffer_request_room(tty, len)) =3D 0=
) {
-			len =3D MIN(len, sizeof(stl_unwanted));
+			len =3D min(len, sizeof(stl_unwanted));
 			outb(GRXFIFO, (ioaddr + XP_ADDR));
 			insb((ioaddr + XP_DATA), &stl_unwanted[0], len);
 			portp->stats.rxlost +=3D len;
 			portp->stats.rxtotal +=3D len;
 		} else {
-			len =3D MIN(len, buflen);
+			len =3D min(len, buflen);
 			if (len > 0) {
 				unsigned char *ptr;
 				outb(GRXFIFO, (ioaddr + XP_ADDR));
diff --git a/drivers/pcmcia/cistpl.c b/drivers/pcmcia/cistpl.c
index 912c03e..c585c6f 100644
--- a/drivers/pcmcia/cistpl.c
+++ b/drivers/pcmcia/cistpl.c
@@ -590,8 +590,6 @@ EXPORT_SYMBOL(pccard_get_next_tuple);
=20
 /*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D*/
=20
-#define _MIN(a, b)		(((a) < (b)) ? (a) : (b))
-
 int pccard_get_tuple_data(struct pcmcia_socket *s, tuple_t *tuple)
 {
     u_int len;
@@ -607,7 +605,7 @@ int pccard_get_tuple_data(struct pcmcia_
 	return CS_SUCCESS;
     read_cis_cache(s, SPACE(tuple->Flags),
 		   tuple->CISOffset + tuple->TupleOffset,
-		   _MIN(len, tuple->TupleDataMax), tuple->TupleData);
+		   min(len, tuple->TupleDataMax), tuple->TupleData);
     return CS_SUCCESS;
 }
 EXPORT_SYMBOL(pccard_get_tuple_data);
diff --git a/drivers/s390/crypto/z90common.h b/drivers/s390/crypto/z90commo=
n.h
index dbbcda3..569120e 100644
--- a/drivers/s390/crypto/z90common.h
+++ b/drivers/s390/crypto/z90common.h
@@ -160,7 +160,6 @@ #else
 #define PDEBUG(fmt, args...) do {} while (0)
 #endif
=20
-#define UMIN(a,b) ((a) < (b) ? (a) : (b))
 #define IS_EVEN(x) ((x) =3D (2 * ((x) / 2)))
=20
 #endif
diff --git a/drivers/s390/crypto/z90main.c b/drivers/s390/crypto/z90main.c
index b2f20ab..c347995 100644
--- a/drivers/s390/crypto/z90main.c
+++ b/drivers/s390/crypto/z90main.c
@@ -2119,7 +2119,7 @@ #define LBUFSIZE 1200
 	if (count <=3D 0)
 		return 0;
=20
-	local_count =3D UMIN((unsigned int)count, LBUFSIZE-1);
+	local_count =3D min((unsigned int)count, LBUFSIZE-1);
=20
 	if (copy_from_user(lbuf, buffer, local_count) !=3D 0) {
 		kfree(lbuf);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
