From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 07 Aug 2005 22:57:44 +0000
Subject: [KJ] [PATCH] amifdreg.h: remove unused macros
Message-Id: <20050807225744.GA8715@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============031180729808037988=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============031180729808037988==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/linux/amifdreg.h |   21 ---------------------
 1 files changed, 21 deletions(-)

diff -uprN linux-vanilla/include/linux/amifdreg.h linux-amifdreg/include/linux/amifdreg.h
--- linux-vanilla/include/linux/amifdreg.h	2005-08-08 02:17:04.000000000 +0400
+++ linux-amifdreg/include/linux/amifdreg.h	2005-08-08 02:54:50.000000000 +0400
@@ -15,25 +15,11 @@
 */
 
 #define DSKMOTOR    (0x1<<7)        /* motor on when low */
-#define DSKSEL3     (0x1<<6)        /* select drive 3 when low */
-#define DSKSEL2     (0x1<<5)        /* select drive 2 when low */
-#define DSKSEL1     (0x1<<4)        /* select drive 1 when low */
-#define DSKSEL0     (0x1<<3)        /* select drive 0 when low */
 #define DSKSIDE     (0x1<<2)        /* side selection: 0 = upper, 1 = lower */
 #define DSKDIREC    (0x1<<1)        /* step direction: 0=in, 1=out (to trk 0) */
 #define DSKSTEP     (0x1)           /* pulse low to step head 1 track */
 
 /*
-** DSKBYTR bits (read only)
-*/
-
-#define DSKBYT      (1<<15)         /* register contains valid byte when set */
-#define DMAON       (1<<14)         /* disk DMA enabled */
-#define DISKWRITE   (1<<13)         /* disk write bit in DSKLEN enabled */
-#define WORDEQUAL   (1<<12)         /* DSKSYNC register match when true */
-/* bits 7-0 are data */
-
-/*
 ** ADKCON/ADKCONR bits
 */
 
@@ -42,7 +28,6 @@
 #endif
 #define ADK_PRECOMP1    (1<<14)     /* precompensation selection */
 #define ADK_PRECOMP0    (1<<13)     /* 00=none, 01=140ns, 10=280ns, 11=500ns */
-#define ADK_MFMPREC     (1<<12)     /* 0=GCR precomp., 1=MFM precomp. */
 #define ADK_WORDSYNC    (1<<10)     /* enable DSKSYNC auto DMA */
 #define ADK_MSBSYNC     (1<<9)      /* when 1, enable sync on MSbit (for GCR) */
 #define ADK_FAST        (1<<8)      /* bit cell: 0=2us (GCR), 1=1us (MFM) */
@@ -55,12 +40,6 @@
 #define DSKLEN_WRITE    (1<<14)
 
 /*
-** INTENA/INTREQ bits
-*/
-
-#define DSKINDEX    (0x1<<4)        /* DSKINDEX bit */
-
-/*
 ** Misc
 */
  


--===============031180729808037988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============031180729808037988==--
