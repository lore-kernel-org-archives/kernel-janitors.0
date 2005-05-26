From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 03:42:39 +0000
Subject: [KJ] [PATCH] kernel/power/disk.c string fix and if-less iterator
Message-Id: <20050526004239.0f288228.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Thu__26_May_2005_00_42_39_-0300_KIJDHIeFsnWWunOS"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__26_May_2005_00_42_39_-0300_KIJDHIeFsnWWunOS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

The attached patch:

o  Fixes kernel/power/disk.c string declared as 'char *p = "...";' to be
   declared as 'char p[] = "...";', as pointed by Jeff Garzik.

o  Replaces:
	i++:
	if (i > 3) i = 0;

   By:
	i = (i + 1) % (sizeof(p) - 1);

   Which is if-less, and the adjust value is evaluated by the compiler in
   compile-time in case the string related to this loop is modified.


---

 kernel/power/disk.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--Multipart=_Thu__26_May_2005_00_42_39_-0300_KIJDHIeFsnWWunOS
Content-Type: text/plain;
 name="kernel_power_disk.patch"
Content-Disposition: attachment;
 filename="kernel_power_disk.patch"
Content-Transfer-Encoding: 7bit

diff -urNp -X dontdiff linux-2.6.11.10/kernel/power/disk.c mod-linux-2.6.11.10/kernel/power/disk.c
--- linux-2.6.11.10/kernel/power/disk.c	2005-05-16 14:51:53.000000000 -0300
+++ mod-linux-2.6.11.10/kernel/power/disk.c	2005-05-26 00:23:28.000000000 -0300
@@ -89,15 +89,13 @@ static void free_some_memory(void)
 	unsigned int i = 0;
 	unsigned int tmp;
 	unsigned long pages = 0;
-	char *p = "-\\|/";
+	char p[] = "-\\|/";
 
 	printk("Freeing memory...  ");
 	while ((tmp = shrink_all_memory(10000))) {
 		pages += tmp;
 		printk("\b%c", p[i]);
-		i++;
-		if (i > 3)
-			i = 0;
+		i = (i + 1) % (sizeof(p) - 1);
 	}
 	printk("\bdone (%li pages freed)\n", pages);
 }

--Multipart=_Thu__26_May_2005_00_42_39_-0300_KIJDHIeFsnWWunOS
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Multipart=_Thu__26_May_2005_00_42_39_-0300_KIJDHIeFsnWWunOS--
