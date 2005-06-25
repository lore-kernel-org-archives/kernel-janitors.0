From: Carlo Perassi <carlo@linux.it>
Date: Sat, 25 Jun 2005 09:05:09 +0000
Subject: [KJ] [PATCH] [RESEND] bonding - uninitialize static variables
Message-Id: <20050625090509.GA5337@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48373994187336344=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48373994187336344==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

One of the tasks at http://janitor.kernelnewbies.org/TODO
is described as
"
uninitialize static variables initialized to 0, to make it go to the
.bss, instead of .data.
"

To proof that it is still guaranteed that those variables will be
initialized to zero

Tom Bradley <tojabr@gmail.com> (on the kernel-janitors mailing list)
wrote
"
the default for gcc is `-fzero-initialized-in-bss', the kernel
makefile does not change this therefore bss is zeroed, this is
documented in the gcc manpage.
"

and David P Howell <david.p.howell@intel.com> added that
"
By definition .bss is always zero'ed by the implementation.
"

This patch uninitializes five static int initialized to 0.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
--- linux-2.6.12.orig/drivers/net/bonding/bond_main.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.12/drivers/net/bonding/bond_main.c	2005-06-25 10:30:52.000000000 +0200
@@ -531,14 +531,14 @@
 
 static int max_bonds	= BOND_DEFAULT_MAX_BONDS;
 static int miimon	= BOND_LINK_MON_INTERV;
-static int updelay	= 0;
-static int downdelay	= 0;
+static int updelay;
+static int downdelay;
 static int use_carrier	= 1;
-static char *mode	= NULL;
-static char *primary	= NULL;
-static char *lacp_rate	= NULL;
+static char *mode;
+static char *primary;
+static char *lacp_rate;
 static int arp_interval = BOND_LINK_ARP_INTERV;
-static char *arp_ip_target[BOND_MAX_ARP_TARGETS] = { NULL, };
+static char *arp_ip_target[BOND_MAX_ARP_TARGETS];
 
 module_param(max_bonds, int, 0);
 MODULE_PARM_DESC(max_bonds, "Max number of bonded devices");
@@ -572,12 +572,12 @@ static LIST_HEAD(bond_dev_list);
 static struct proc_dir_entry *bond_proc_dir = NULL;
 #endif
 
-static u32 arp_target[BOND_MAX_ARP_TARGETS] = { 0, } ;
-static int arp_ip_count	= 0;
-static u32 my_ip	= 0;
+static u32 arp_target[BOND_MAX_ARP_TARGETS];
+static int arp_ip_count;
+static u32 my_ip;
 static int bond_mode	= BOND_MODE_ROUNDROBIN;
-static int lacp_fast	= 0;
-static int app_abi_ver	= 0;
+static int lacp_fast;
+static int app_abi_ver;
 static int orig_app_abi_ver = -1; /* This is used to save the first ABI version
 				   * we receive from the application. Once set,
 				   * it won't be changed, and the module will

--===============48373994187336344==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48373994187336344==--
