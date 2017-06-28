From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 11:49:07 +0000
Subject: [PATCH] powerpc: remapping too much memory
Message-Id: <20170628114907.kf3t65mrdbq7rsfm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Wood <oss@buserror.net>
Cc: Kumar Gala <galak@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

There is a cut and paste error here so we use "sizeof(struct mpc83xx_pmc)"
to remap the memory for "clock_regs".  That sizeof() is 20 bytes and we
only need to remap 12 bytes.  It presumably doesn't affect run time too
much...

I changed them to both use "sizeof(*variable_name)" because that's the
prefered kernel style these days.

Fixes: d49747bdfb2d ("powerpc/mpc83xx: Power Management support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms/83xx/suspend.c
index 978b85bb3233..7fa3e197871a 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -361,7 +361,7 @@ static int pmc_probe(struct platform_device *ofdev)
 			return -EBUSY;
 	}
 
-	pmc_regs = ioremap(res.start, sizeof(struct mpc83xx_pmc));
+	pmc_regs = ioremap(res.start, sizeof(*pmc_regs));
 
 	if (!pmc_regs) {
 		ret = -ENOMEM;
@@ -374,7 +374,7 @@ static int pmc_probe(struct platform_device *ofdev)
 		goto out_pmc;
 	}
 
-	clock_regs = ioremap(res.start, sizeof(struct mpc83xx_pmc));
+	clock_regs = ioremap(res.start, sizeof(*clock_regs));
 
 	if (!clock_regs) {
 		ret = -ENOMEM;
