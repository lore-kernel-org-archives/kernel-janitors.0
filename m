From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 04 Jul 2018 06:20:32 +0000
Subject: Re: [PATCH] mfd: kempld-core: constify variables that point to const structure
Message-Id: <20180704062032.GX20176@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528865289-3875-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1528865289-3875-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 13 Jun 2018, Julia Lawall wrote:

> Add const to the declaration of various local variables of type
> kempld_platform_data for which the referenced value is always only
> dereferenced or passed to a const parameter, to record the fact that
> kempld_platform_data_generic is declared as const.
> 
> The semantic match that finds this issue is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> identifier i,j;
> @@
> const struct i j = { ... };
> 
> @ok@
> identifier r.i;
> position p;
> @@
> const struct i@p *
> 
> @@
> identifier r.i;
> position p != ok.p;
> @@
> * struct i@p *
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/mfd/kempld-core.c |   15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
