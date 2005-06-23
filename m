From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:30:23 +0000
Subject: [KJ] [PATCH] bonding - a trailing whitespace
Message-Id: <20050623193023.GF4398@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25532475036212166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25532475036212166==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A trailing whitespace found making a previuos patch on the same file

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
 drivers/net/bonding/bond_main.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.12/drivers/net/bonding/bond_main.c
===================================================================
--- linux-2.6.12.orig/drivers/net/bonding/bond_main.c
+++ linux-2.6.12/drivers/net/bonding/bond_main.c
@@ -572,7 +572,7 @@
 static struct proc_dir_entry *bond_proc_dir = NULL;
 #endif
 
-static u32 arp_target[BOND_MAX_ARP_TARGETS] = { 0, } ;
+static u32 arp_target[BOND_MAX_ARP_TARGETS] = { 0, };
 static int arp_ip_count;
 static u32 my_ip	= 0;
 static int bond_mode	= BOND_MODE_ROUNDROBIN;

--===============25532475036212166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25532475036212166==--
