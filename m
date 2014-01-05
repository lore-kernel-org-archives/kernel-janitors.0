From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 05 Jan 2014 10:44:03 +0000
Subject: Re: [PATCH 2/3] ALSA: cs5535audio: use named constants for pci_power_t values
Message-Id: <s5hzjnabte4.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
 <1388706031-22180-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388706031-22180-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jaya Kumar <jayakumar.alsa@gmail.com>

At Fri,  3 Jan 2014 00:40:30 +0100,
Julia Lawall wrote:
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression pdev;
> @@
> 
> pci_set_power_state(pdev,
> - 3
> + PCI_D3hot
>  )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied.


Takashi

> 
> ---
>  sound/pci/cs5535audio/cs5535audio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
> index 902bebd..c0d2835 100644
> --- a/sound/pci/cs5535audio/cs5535audio.c
> +++ b/sound/pci/cs5535audio/cs5535audio.c
> @@ -253,7 +253,7 @@ static irqreturn_t snd_cs5535audio_interrupt(int irq, void *dev_id)
>  static int snd_cs5535audio_free(struct cs5535audio *cs5535au)
>  {
>  	synchronize_irq(cs5535au->irq);
> -	pci_set_power_state(cs5535au->pci, 3);
> +	pci_set_power_state(cs5535au->pci, PCI_D3hot);
>  
>  	if (cs5535au->irq >= 0)
>  		free_irq(cs5535au->irq, cs5535au);
> 
