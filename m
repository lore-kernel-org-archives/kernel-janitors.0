From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 11 Jul 2018 12:24:42 +0000
Subject: Re: [PATCH] staging: speakup: remove redundant variable l
Message-Id: <20180711122442.mele6xunacmpbxe3@var.youpi.perso.aquilenet.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711112607.31292-1-colin.king@canonical.com>
In-Reply-To: <20180711112607.31292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King, le mer. 11 juil. 2018 12:26:07 +0100, a ecrit:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable l is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'l' set but not used [-Wunused-but-set-variable
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  drivers/staging/speakup/varhandlers.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/speakup/varhandlers.c b/drivers/staging/speakup/varhandlers.c
> index 54a76b6752ad..1b545152cc49 100644
> --- a/drivers/staging/speakup/varhandlers.c
> +++ b/drivers/staging/speakup/varhandlers.c
> @@ -179,7 +179,6 @@ int spk_set_num_var(int input, struct st_var_header *var, int how)
>  {
>  	int val;
>  	int *p_val = var->p_val;
> -	int l;
>  	char buf[32];
>  	char *cp;
>  	struct var_t *var_data = var->data;
> @@ -237,9 +236,9 @@ int spk_set_num_var(int input, struct st_var_header *var, int how)
>  	else
>  		cp = buf;
>  	if (!var_data->u.n.out_str)
> -		l = sprintf(cp, var_data->u.n.synth_fmt, (int)val);
> +		sprintf(cp, var_data->u.n.synth_fmt, (int)val);
>  	else
> -		l = sprintf(cp,	var_data->u.n.synth_fmt, var_data->u.n.out_str[val]);
> +		sprintf(cp, var_data->u.n.synth_fmt, var_data->u.n.out_str[val]);
>  	synth_printf("%s", cp);
>  	return 0;
>  }
> -- 
> 2.17.1
> 

-- 
Samuel
> Allez, soyez sympa ... traduisez-lui "linux"
Linux, c'est comme le miel : c'est vachement bon mais ça attire les
mouches. En plus, ça colle aux doigts et on a du mal à s'en défaire.
-+- TP in: Guide du linuxien pervers - "Barrez vous les mouches !"
