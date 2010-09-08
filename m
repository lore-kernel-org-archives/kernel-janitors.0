From: Clemens Ladisch <clemens@ladisch.de>
Date: Wed, 08 Sep 2010 09:40:16 +0000
Subject: Re: [patch] ALSA: rawmidi: cleanup the get next midi device ioctl
Message-Id: <4C875A00.7030005@ladisch.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908085308.GC32047@bicker>
In-Reply-To: <20100908085308.GC32047@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Ulrich Drepper <drepper@redhat.com>

Dan Carpenter wrote:
> I'm doing an audit to find integer overflows and my static checker
> complained that in the original code "device + 1" could overflow.  The
> overflow is harmless, but it's still worth cleaning up.  The other thing
> that I noticed is that if you pass in a device which is higher than
> SNDRV_RAWMIDI_DEVICES then it doesn't return an error code but just
> tells you that the next device is "device + 1".
> 
> I have rewritten it to just return -EINVAL if you pass in a bogus value
> that's either too high or too low.

A negative value is a valid input.

> +		if (device > SNDRV_RAWMIDI_DEVICES)
> +			return -EINVAL;

		if (device >= SNDRV_RAWMIDI_DEVICES)


Regards,
Clemens
