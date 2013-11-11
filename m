From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 11 Nov 2013 00:13:14 +0000
Subject: Re: [alsa-devel] [patch] ASoC: rcar: off by one in rsnd_scu_set_route()
Message-Id: <87iovzdcdo.wl%kuninori.morimoto.gx@renesas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108094610.GE27977@elgon.mountain>
In-Reply-To: <20131108094610.GE27977@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>


Hi

> If "id = ARRAY_SIZE(routes)" then we read one space beyond the end of
> the routes[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/soc/sh/rcar/scu.c b/sound/soc/sh/rcar/scu.c
> index 1ab1bce..5e46ef2 100644
> --- a/sound/soc/sh/rcar/scu.c
> +++ b/sound/soc/sh/rcar/scu.c

Nice catch
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> @@ -68,7 +68,7 @@ static int rsnd_scu_set_route(struct rsnd_priv *priv,
>  		return 0;
>  
>  	id = rsnd_mod_id(mod);
> -	if (id < 0 || id > ARRAY_SIZE(routes))
> +	if (id < 0 || id >= ARRAY_SIZE(routes))
>  		return -EIO;
>  
>  	/*
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel


Best regards
---
Kuninori Morimoto
