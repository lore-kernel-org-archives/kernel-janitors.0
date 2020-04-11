From: Joe Perches <joe@perches.com>
Date: Sat, 11 Apr 2020 11:05:43 +0000
Subject: Re: [PATCH] crypto: marvell/octeontx - Add missing '\n' in log messages
Message-Id: <d40b2b993d8e9764c5e7f6fd3f8ca037a9520b6e.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411104458.21526-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411104458.21526-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com, herbert@gondor.apana.org.au, davem@davemloft.net, lbartosik@marvell.com, colin.king@canonical.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2020-04-11 at 12:44 +0200, Christophe JAILLET wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> While at it, I've introduced a few pr_cont that looked logical to me.

Hi again Christophe.

> diff --git a/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c b/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c
[]
> @@ -629,15 +629,15 @@ static void print_dbg_info(struct device *dev,
>  				pr_debug("Slot%d: %s", j, engs_info);
>  				bitmap_to_arr32(mask, engs->bmap,
>  						eng_grps->engs_num);
> -				pr_debug("Mask:  %8.8x %8.8x %8.8x %8.8x",
> -					 mask[3], mask[2], mask[1], mask[0]);
> +				pr_cont(" Mask: %8.8x %8.8x %8.8x %8.8x\n",
> +					mask[3], mask[2], mask[1], mask[0]);

Unfortunately, a pr_debug cannot reasonably be followed by pr_cont.

pr_debug is conditionally compiled and if CONFIG_DYNAMIC_DEBUG
is enabled, conditionally emitted.

pr_cont is not conditionally compiled and is always emitted.

So this is fine as is (or with terminating newlines added)

> @@ -1147,8 +1147,9 @@ static int delete_engine_group(struct device *dev,
>  		for (i = 0; i < OTX_CPT_MAX_ENGINE_GROUPS; i++) {
>  			if (eng_grp->g->grp[i].mirror.is_ena &&
>  			    eng_grp->g->grp[i].mirror.idx = eng_grp->idx)
> -				dev_err(dev, "engine_group%d", i);
> +				pr_cont(" engine_group%d", i);
>  		}
> +		pr_cont("\n");
>  		return -EINVAL;
>  	}

This one is probably reasonable, but I suggest that "engine_group%d"
is a bit redundant and this might be better as something like:

diff --git a/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c b/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c
index d04baa3..a6bb6c7 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptpf_ucode.c
@@ -1142,13 +1143,14 @@ static int delete_engine_group(struct device *dev,
 		return -EINVAL;
 
 	if (eng_grp->mirror.ref_count) {
-		dev_err(dev, "Can't delete engine_group%d as it is used by:",
+		dev_err(dev, "Can't delete engine_group%d as it is used by engine_group(s):",
 			eng_grp->idx);
 		for (i = 0; i < OTX_CPT_MAX_ENGINE_GROUPS; i++) {
 			if (eng_grp->g->grp[i].mirror.is_ena &&
 			    eng_grp->g->grp[i].mirror.idx = eng_grp->idx)
-				dev_err(dev, "engine_group%d", i);
+				pr_cont(dev, " %d", i);
 		}
+		pr_cont("\n");
 		return -EINVAL;
 	}
 
