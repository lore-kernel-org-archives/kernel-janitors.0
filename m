From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 09 Sep 2010 06:57:26 +0000
Subject: Re: [patch v2] ALSA: rawmidi: fix the get next midi device ioctl
Message-Id: <s5hk4mvs8tl.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908085308.GC32047@bicker> <20100908193641.GA3463@bicker>
	<s5hvd6grova.wl%tiwai@suse.de>
	<alpine.LNX.2.00.1009082325570.6226@eeebox2.perex-int.cz>
In-Reply-To: <alpine.LNX.2.00.1009082325570.6226@eeebox2.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>, Dan Carpenter <error27@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Ulrich Drepper <drepper@redhat.com>

At Wed, 8 Sep 2010 23:29:14 +0200 (CEST),
Jaroslav Kysela wrote:
> 
> On Wed, 8 Sep 2010, Takashi Iwai wrote:
> 
> > At Wed, 8 Sep 2010 21:36:41 +0200,
> > Dan Carpenter wrote:
> >>
> >> If we pass in a device which is higher than SNDRV_RAWMIDI_DEVICES then
> >> this function just returns device + 1 which isn't helpful.  I've
> >> modified it to return -EINVAL instead.
> >>
> >> Also Smatch complains because the "device + 1" could be an integer
> >> overflow.  It's harmless, but we may as well silence the warning.
> >>
> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> >> ---
> >> V2:  In the first version I made negative values return -EINVAL
> >>
> >> diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
> >> index eb68326..1633bac 100644
> >> --- a/sound/core/rawmidi.c
> >> +++ b/sound/core/rawmidi.c
> >> @@ -829,6 +829,8 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
> >>
> >>  		if (get_user(device, (int __user *)argp))
> >>  			return -EFAULT;
> >> +		if (device > SNDRV_RAWMIDI_DEVICES)
> >> +			return -EINVAL;
> >
> > This should be "device >= SNDRV_RAWMIDI_DEVICES".
> 
> Also note that this check changes a bit semantics. All other NEXT_DEVICE 
> ioctls returns -1 if the value is beyond the last device (meaning no more 
> devices were found). So the
> 
>                 if (device = SNDRV_RAWMIDI_DEVICES)
>                          device = -1;
> 
> check should be
> 
>                 if (device >= SNDRV_RAWMIDI_DEVICES)
>                          device = -1;
> 
> ... resulting in one line patch.

But this doesn't work when you pass device = INT_MAX :)


Takashi
