From: Clemens Buchacher <drizzd@aon.at>
Date: Sun, 19 Sep 2004 15:25:32 +0000
Subject: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040920150619.GB12577@kzelldran>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42386064124156353=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============42386064124156353==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description: __FUNCTION__ string concatenation is deprecated

Diff against linux-2.6 up to ChangeSet@1.1938 (04/09/18 20:30:01)

 arch/mips/au1000/db1x00/mirage_ts.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Status: untested

Signed-off-by: Clemens Buchacher <drizzd@aon.at>

# arch/mips/au1000/db1x00/mirage_ts.c
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +1 -1
#   __FUNCTION__ string concatenation is deprecated
diff -Nru a/arch/mips/au1000/db1x00/mirage_ts.c b/arch/mips/au1000/db1x00/mirage_ts.c
--- a/arch/mips/au1000/db1x00/mirage_ts.c	2004-09-20 15:14:54 +02:00
+++ b/arch/mips/au1000/db1x00/mirage_ts.c	2004-09-20 15:14:54 +02:00
@@ -68,7 +68,7 @@
 #define err(format, arg...) printk(KERN_ERR TS_NAME ": " format "\n" , ## arg)
 #define info(format, arg...) printk(KERN_INFO TS_NAME ": " format "\n" , ## arg)
 #define warn(format, arg...) printk(KERN_WARNING TS_NAME ": " format "\n" , ## arg)
-#define DPRINTK(format, arg...) printk(__FUNCTION__ ": " format "\n" , ## arg)
+#define DPRINTK(format, arg...) printk("%s: " format "\n", __FUNCTION__ , ## arg)
 
 
 #define PEN_DOWN_IRQ	AU1000_GPIO_7

--===============42386064124156353==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42386064124156353==--
