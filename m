From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 24 Nov 2017 11:33:04 +0000
Subject: RE: [PATCH 1/2] ASoC: da7213: Delete an error message for a failed memory allocation in da7213_fw_to
Message-Id: <alpine.DEB.2.20.1711241231560.3316@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-640844049-1511523185=:3316"
List-Id: <kernel-janitors.vger.kernel.org>
References: <babe2503-46f1-2e1e-b482-62cd3e89f246@users.sourceforge.net>
 <6dc71b14-4c14-82f6-9dad-92bfa9854de2@users.sourceforge.net>
 <2E89032DDAA8B9408CB92943514A0337014C1B116F@SW-EX-MBX01.diasemi.com>
In-Reply-To: <2E89032DDAA8B9408CB92943514A0337014C1B116F@SW-EX-MBX01.diasemi.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Support Opensource <Support.Opensource@diasemi.com>, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, SF Markus Elfring <elfring@users.sourceforge.net>

--8323329-640844049-1511523185=:3316
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 24 Nov 2017, Adam Thomson wrote:

> On 23 November 2017 17:33, SF Markus Elfring wrote:
>
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 23 Nov 2017 17:56:54 +0100
> >
> > Omit an extra message for a memory allocation failure in this function.
>
> I'm not sure this is an extra message. We don't return -ENOMEM as a result of
> this operation and probe won't fail on this. So does devm_kzalloc() print error
> messages?

Unless there is NO WARN, a backtrace will be generated in the out of
memory case.

julia

>
> > This issue was detected by using the Coccinelle software.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  sound/soc/codecs/da7213.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> > index 41d9b1da27c2..d1b77a0e3b74 100644
> > --- a/sound/soc/codecs/da7213.c
> > +++ b/sound/soc/codecs/da7213.c
> > @@ -1654,10 +1654,8 @@ static struct da7213_platform_data
> >  	u32 fw_val32;
> >
> >  	pdata = devm_kzalloc(codec->dev, sizeof(*pdata), GFP_KERNEL);
> > -	if (!pdata) {
> > -		dev_warn(codec->dev, "Failed to allocate memory for pdata\n");
> > +	if (!pdata)
> >  		return NULL;
> > -	}
> >
> >  	if (device_property_read_u32(dev, "dlg,micbias1-lvl", &fw_val32) >= 0)
> >  		pdata->micbias1_lvl = da7213_of_micbias_lvl(codec, fw_val32);
> > --
> > 2.15.0
> N?????r??y??????X??ǧv???)޺{.n?????z?ޖ6?????)?????*jg????????ݢj/???z?ޖ????ޙ????&?)ߡ?a???????G???????:+v???w????
--8323329-640844049-1511523185=:3316--
