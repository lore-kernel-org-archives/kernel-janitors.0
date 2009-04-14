From: Diego Liziero <diegoliz@gmail.com>
Date: Tue, 14 Apr 2009 02:33:54 +0000
Subject: [PATCH] drivers/staging/winbond boolean negation and bitwise operation
Message-Id: <49E3F612.5020606@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From: Diego Liziero <diegoliz@gmail.com>

The semantic patch that makes this change is:
(http://www.emn.fr/x-info/coccinelle/)

@@ expression E; constant C; @@
(
- !E = C
+ E != C
)

Signed-off-by: Diego Liziero <diegoliz@gmail.com>

diff = 
--- ./drivers/staging/winbond/mds.c	2009-04-13 01:21:29.000000000 +0200
+++ /tmp/cocci-output-30079-9c4ec4-mds.c	2009-04-13 20:44:20.000000000 +0200
@@ -432,7 +432,7 @@ Mds_Tx(struct wbsoft_priv * adapter)
 		return;
 
 	//Only one thread can be run here
-	if (!atomic_inc_return(&pMds->TxThreadCount) = 1)
+	if (atomic_inc_return(&pMds->TxThreadCount) != 1)
 		goto cleanup;
 
 	// Start to fill the data
