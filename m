From: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
Date: Thu, 20 Jan 2005 22:04:03 +0000
Subject: [KJ] [PATCH] gcc-4.0 allyesconfig fixes
Message-Id: <20050120220402.GB22673@ens-lyon.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83884886809916548=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83884886809916548==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

the following patch (against latest -mm), correct compilation errors with
gcc-4.0 (snapshot 20050116).

please correct me if i did something wrong, this is my first patch
with the linux kernel.

Benoit

diff -Naurp --exclude=ctags linux-clean/drivers/char/generic_serial.c linux-2.6-mm-test/drivers/char/generic_serial.c
--- linux-clean/drivers/char/generic_serial.c	2005-01-20 22:12:57.000000000 +0100
+++ linux-2.6-mm-test/drivers/char/generic_serial.c	2005-01-20 21:27:11.000000000 +0100
@@ -36,7 +36,7 @@
 static char *                  tmp_buf; 
 static DECLARE_MUTEX(tmp_buf_sem);
 
-static int gs_debug;
+int gs_debug;
 
 #ifdef DEBUG
 #define gs_dprintk(f, str...) if (gs_debug & f) printk (str)
diff -Naurp --exclude=ctags linux-clean/drivers/net/s2io.h linux-2.6-mm-test/drivers/net/s2io.h
--- linux-clean/drivers/net/s2io.h	2005-01-20 22:13:01.000000000 +0100
+++ linux-2.6-mm-test/drivers/net/s2io.h	2005-01-20 21:47:30.000000000 +0100
@@ -739,8 +739,8 @@ typedef struct s2io_nic {
 static inline u64 readq(void __iomem *addr)
 {
 	u64 ret = readl(addr + 4);
-	(u64) ret <<= 32;
-	(u64) ret |= readl(addr);
+	ret = ret << 32;
+	ret = ret | readl(addr);
 
 	return ret;
 }


--===============83884886809916548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83884886809916548==--
