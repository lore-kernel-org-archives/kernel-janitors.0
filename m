From: Rene Herman <rene.herman@keyaccess.nl>
Date: Fri, 08 Aug 2008 15:42:15 +0000
Subject: Re: [PATCH] sound/pci/cs46xx/cs46xx_lib.c: remove unused variable
Message-Id: <489C6957.3040803@keyaccess.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1218195562.4609.7.camel@niro-laptop>
In-Reply-To: <1218195562.4609.7.camel@niro-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Borisov <niro@tut.by>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, abramo@alsa-project.org, kernel-janitors@vger.kernel.org

On 08-08-08 13:39, Michael Borisov wrote:

> This patch fixes the following compile warning:
> sound/pci/cs46xx/cs46xx_lib.c: In function 'snd_cs46xx_resume':
> sound/pci/cs46xx/cs46xx_lib.c:3614: warning: unused variable 'i'
> 
>  cs46xx_lib.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Signed-off-by: Michael Borisov <niro@tut.by>
> ---
> diff --git a/sound/pci/cs46xx/cs46xx_lib.c
> b/sound/pci/cs46xx/cs46xx_lib.c
> index e214e56..07bb7e0 100644
> --- a/sound/pci/cs46xx/cs46xx_lib.c
> +++ b/sound/pci/cs46xx/cs46xx_lib.c
> @@ -3611,7 +3611,7 @@ int snd_cs46xx_resume(struct pci_dev *pci)
>  {
>  	struct snd_card *card = pci_get_drvdata(pci);
>  	struct snd_cs46xx *chip = card->private_data;
> -	int i, amp_saved;
> +	int amp_saved;
>  
>  	pci_set_power_state(pci, PCI_D0);
>  	pci_restore_state(pci);
> @@ -3633,6 +3633,7 @@ int snd_cs46xx_resume(struct pci_dev *pci)
>  #ifdef CONFIG_SND_CS46XX_NEW_DSP
>  	cs46xx_dsp_resume(chip);
>  	/* restore some registers */
> +	int i;
>  	for (i = 0; i < ARRAY_SIZE(saved_regs); i++)
>  		snd_cs46xx_pokeBA0(chip, saved_regs[i], chip->saved_regs[i]);
>  #else

Mixing code and declarations is C99 and I'm afraid kernel developers 
haven't gotten around to upgrading themselves for the last 9 years yet 
so this is unfortunately not accepted style.

I'm afraid you need a { } code block so that the declaration can go at 
the top of that to stay C89 compatible.

Rene.
