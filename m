From: Jonathan Nieder <jrnieder@gmail.com>
Date: Fri, 04 May 2012 09:45:38 +0000
Subject: Re: [PATCH] [media] cx88: Remove duplicate const
Message-Id: <20120504094538.GP6451@burratino>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336124017-19538-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1336124017-19538-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: mchehab@infradead.org, rusty@rustcorp.com.au, hans.verkuil@cisco.com, istvan_v@mailbox.hu, dheitmueller@kernellabs.com, thunder.mmm@gmail.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Emil Goode wrote:

> This patch fixes the following sparse warnings
> by removing use of duplicate const.

Is this really just about quieting sparse noise?

I would find it clearer to read a more straightforward explanation
like

	Remove some redundant uses of "const" detected by sparse:

but that is only a nitpick.

[...]
> --- a/drivers/media/video/cx88/cx88-alsa.c
> +++ b/drivers/media/video/cx88/cx88-alsa.c
> @@ -766,7 +766,7 @@ static struct snd_kcontrol_new snd_cx88_alc_switch = {
>   * Only boards with eeprom and byte 1 at eeprom=1 have it
>   */
>  
> -static const struct pci_device_id const cx88_audio_pci_tbl[] __devinitdata = {
> +static const struct pci_device_id cx88_audio_pci_tbl[] __devinitdata = {

These double "const" were introduced in v2.6.37-rc1~64^2~464 (V4L/DVB:
drivers/media: Make static data tables and strings const, 2010-08-25).

The address of an array is already immutable by definition, so for
what it's worth, with or without a clarified commit message,

Acked-by: Jonathan Nieder <jrnieder@gmail.com>
