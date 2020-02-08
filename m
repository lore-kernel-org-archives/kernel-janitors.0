From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 08 Feb 2020 14:09:04 +0000
Subject: [PATCH 1/2] powerpc/83xx: Fix some typo in some warning message
Message-Id: <20200208140904.7521-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oss@buserror.net, galak@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

"couldn;t" should be "couldn't".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/platforms/83xx/km83xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index ada42f03915a..306be75faec7 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -53,13 +53,13 @@ static void quirk_mpc8360e_qe_enet10(void)
 
 	np_par = of_find_node_by_name(NULL, "par_io");
 	if (np_par = NULL) {
-		pr_warn("%s couldn;t find par_io node\n", __func__);
+		pr_warn("%s couldn't find par_io node\n", __func__);
 		return;
 	}
 	/* Map Parallel I/O ports registers */
 	ret = of_address_to_resource(np_par, 0, &res);
 	if (ret) {
-		pr_warn("%s couldn;t map par_io registers\n", __func__);
+		pr_warn("%s couldn't map par_io registers\n", __func__);
 		return;
 	}
 
-- 
2.20.1
