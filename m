From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Thu, 01 Sep 2016 09:45:41 +0000
Subject: Re: [PATCH] ASoC: constify snd_soc_codec_driver structures
Message-Id: <20160901094541.GD21682@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472680347-19575-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472680347-19575-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

On Wed, Aug 31, 2016 at 11:52:27PM +0200, Julia Lawall wrote:
> Check for snd_soc_codec_driver structures that are only passed to
> snd_soc_register_codec or memcpy (2nd arg), for which the corresponding
> parameters are declared const.  Declare as const snd_soc_codec_driver
> structures that have these properties.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct snd_soc_codec_driver i@p = { ... };
> 
> @ok@
> identifier r.i;
> expression e1,e2,e3;
> position p;
> @@
> (
> snd_soc_register_codec(e1,&i@p,e2,e3)
> |
> memcpy(e1,&i@p,e2)
> )
> 
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> @@
> i@p
> 
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct snd_soc_codec_driver i = { ... };
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

I haven't looked at every single case individually, but the ones
I have looked at look fine.

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
