From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 15 Aug 2005 10:53:38 +0000
Subject: [KJ] Re: [PATCH] sound/ buildcheck fixes
Message-Id: <s5h8xz34gjx.wl%tiwai@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54341107760144669=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200508142023.14439.ace@staticwave.ca>
In-Reply-To: <200508142023.14439.ace@staticwave.ca>
To: Gabriel Devenyi <ace@staticwave.ca>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

--===============54341107760144669==
Content-Type: text/plain; charset=US-ASCII

At Sun, 14 Aug 2005 20:23:14 -0400,
Gabriel Devenyi wrote:
> 
> This applies to linus' current git tree and fixes the following "make buildcheck" errors.

Hmm, I don't think all of the patch is correct.  Most of replacements
__init -> __devinit looks invalid to me, e.g.

> diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
> --- a/sound/arm/aaci.c
> +++ b/sound/arm/aaci.c
> @@ -951,7 +951,7 @@ static struct amba_driver aaci_driver = 
>  	.id_table	= aaci_ids,
>  };
>  
> -static int __init aaci_init(void)
> +static int __devinit aaci_init(void)
>  {
>  	return amba_driver_register(&aaci_driver);
>  }


Takashi

--===============54341107760144669==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54341107760144669==--
