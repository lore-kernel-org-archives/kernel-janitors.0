From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 08 Feb 2020 14:09:20 +0000
Subject: [PATCH 2/2] powerpc/83xx: Add some error handling in 'quirk_mpc8360e_qe_enet10()'
Message-Id: <20200208140920.7652-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oss@buserror.net, galak@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

In some error handling path, we should call "of_node_put(np_par)" or
some resource may be leaking in case of error.

Fixes: 8159df72d43e ("83xx: add support for the kmeter1 board.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/platforms/83xx/km83xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index 306be75faec7..bcdc2c203ec9 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -60,10 +60,12 @@ static void quirk_mpc8360e_qe_enet10(void)
 	ret = of_address_to_resource(np_par, 0, &res);
 	if (ret) {
 		pr_warn("%s couldn't map par_io registers\n", __func__);
-		return;
+		goto out;
 	}
 
 	base = ioremap(res.start, resource_size(&res));
+	if (!base)
+		goto out;
 
 	/*
 	 * set output delay adjustments to default values according
@@ -111,6 +113,7 @@ static void quirk_mpc8360e_qe_enet10(void)
 		setbits32((base + 0xac), 0x0000c000);
 	}
 	iounmap(base);
+out:
 	of_node_put(np_par);
 }
 
-- 
2.20.1
