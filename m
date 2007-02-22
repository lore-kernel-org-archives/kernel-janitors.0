From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 22 Feb 2007 12:24:43 +0000
Subject: Re: [KJ] [Alsa-devel] [PATCH] is_power_of_2 in rtctimer.c
Message-Id: <s5hirdu752s.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1172064021.6127.84.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1172064021.6127.84.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vignesh Babu BM <vignesh.babu@wipro.com>
Cc: Kernel Janitors List <kernel-janitors@lists.osdl.org>, alsa-devel@alsa-project.org, perex@suse.cz

At Wed, 21 Feb 2007 18:50:21 +0530,
Vignesh Babu BM wrote:
>=20
>=20
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2
>=20
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>

Thanks, I applied it to ALSA tree now.


Takashi

> ---=20
> diff --git a/sound/core/rtctimer.c b/sound/core/rtctimer.c
> index 9f7b32e..7cd5e8f 100644
> --- a/sound/core/rtctimer.c
> +++ b/sound/core/rtctimer.c
> @@ -24,6 +24,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/moduleparam.h>
> +#include <linux/log2.h>
>  #include <sound/core.h>
>  #include <sound/timer.h>
> =20
> @@ -129,7 +130,7 @@ static int __init rtctimer_init(void)
>  	struct snd_timer *timer;
> =20
>  	if (rtctimer_freq < 2 || rtctimer_freq > 8192 ||
> -	    (rtctimer_freq & (rtctimer_freq - 1)) !=3D 0) {
> +	    !is_power_of_2(rtctimer_freq)) {
>  		snd_printk(KERN_ERR "rtctimer: invalid frequency %d\n",
>  			   rtctimer_freq);
>  		return -EINVAL;
>=20
> --=20
> Regards, =20
> Vignesh Babu BM =20
> _____________________________________________________________ =20
> "Why is it that every time I'm with you, makes me believe in magic?"
>=20
>=20
> The information contained in this electronic message and any attachments =
to this message are intended for the exclusive use of the addressee(s) and =
may contain proprietary, confidential or privileged information. If you are=
 not the intended recipient, you should not disseminate, distribute or copy=
 this e-mail. Please notify the sender immediately and destroy all copies o=
f this message and any attachments.=20
>=20
> WARNING: Computer viruses can be transmitted via email. The recipient sho=
uld check this email and any attachments for the presence of viruses. The c=
ompany accepts no liability for any damage caused by any virus transmitted =
by this email.
> =20
> www.wipro.com
>=20
> -------------------------------------------------------------------------
> Take Surveys. Earn Cash. Influence the Future of IT
> Join SourceForge.net's Techsay panel and you'll get the chance to share y=
our
> opinions on IT & business topics through brief surveys-and earn cash
> http://www.techsay.com/default.php?page=3Djoin.php&p=3Dsourceforge&CID=DE=
VDEV
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/alsa-devel
>=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
