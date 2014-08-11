From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 11 Aug 2014 07:56:54 +0000
Subject: [PATCH 7/14 v2] powerpc/4xx/cpm: delete unneeded test before of_node_put
Message-Id: <alpine.DEB.2.10.1408110956090.2316@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-3-git-send-email-Julia.Lawall@lip6.fr>
 <1407725796.4508.54.camel@pasglop>
In-Reply-To: <1407725796.4508.54.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Simplify the error path to avoid calling of_node_put when it is not needed.

The semantic patch that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

-if (e)
   of_node_put(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: new subject

 arch/powerpc/sysdev/ppc4xx_cpm.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/ppc4xx_cpm.c b/arch/powerpc/sysdev/ppc4xx_cpm.c
index 82e2cfe..ba95adf 100644
--- a/arch/powerpc/sysdev/ppc4xx_cpm.c
+++ b/arch/powerpc/sysdev/ppc4xx_cpm.c
@@ -281,7 +281,7 @@ static int __init cpm_init(void)
 		printk(KERN_ERR "cpm: could not parse dcr property for %s\n",
 		       np->full_name);
 		ret = -EINVAL;
-		goto out;
+		goto node_put;
 	}

 	cpm.dcr_host = dcr_map(np, dcr_base, dcr_len);
@@ -290,7 +290,7 @@ static int __init cpm_init(void)
 		printk(KERN_ERR "cpm: failed to map dcr property for %s\n",
 		       np->full_name);
 		ret = -EINVAL;
-		goto out;
+		goto node_put;
 	}

 	/* All 4xx SoCs with a CPM controller have one of two
@@ -330,9 +330,9 @@ static int __init cpm_init(void)

 	if (cpm.standby || cpm.suspend)
 		suspend_set_ops(&cpm_suspend_ops);
+node_put:
+	of_node_put(np);
 out:
-	if (np)
-		of_node_put(np);
 	return ret;
 }


