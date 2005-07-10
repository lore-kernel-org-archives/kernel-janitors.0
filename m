From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:20:44 +0000
Subject: [KJ] [PATCH 18/20] Fix "nocast type" warnings
Message-Id: <200507102320.44991.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:drivers/net/bonding/bond_main.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 drivers/net/bonding/bond_main.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

Index: linux-git/drivers/net/bonding/bond_main.c
=================================--- linux-git.orig/drivers/net/bonding/bond_main.c	2005-07-08 12:06:50.000000000 +0000
+++ linux-git/drivers/net/bonding/bond_main.c	2005-07-10 22:43:13.000000000 +0000
@@ -1294,7 +1294,8 @@
 /*
  * Copy all the Multicast addresses from src to the bonding device dst
  */
-static int bond_mc_list_copy(struct dev_mc_list *mc_list, struct bonding *bond, int gpf_flag)
+static int bond_mc_list_copy(struct dev_mc_list *mc_list, struct bonding *bond,
+			     unsigned int __nocast gpf_flag)
 {
 	struct dev_mc_list *dmi, *new_dmi;
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
