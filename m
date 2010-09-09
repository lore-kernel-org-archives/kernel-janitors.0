From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Sep 2010 08:46:05 +0000
Subject: Re: [patch v2] ALSA: rawmidi: fix the get next midi device ioctl
Message-Id: <20100909084605.GB10250@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100908193641.GA3463@bicker> <4C889074.6060901@ladisch.de>
In-Reply-To: <4C889074.6060901@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>, Ulrich Drepper <drepper@redhat.com>

On Thu, Sep 09, 2010 at 09:44:52AM +0200, Clemens Ladisch wrote:
> Dan Carpenter wrote:
> > If we pass in a device which is higher than SNDRV_RAWMIDI_DEVICES then
> > this function just returns device + 1 which isn't helpful.  I've
> > modified it to return -EINVAL instead.
> > 
> > Also Smatch complains because the "device + 1" could be an integer
> > overflow.  It's harmless,
> 
> It would result in device=INT_MIN, which would make the while loop go
> through 2^31 values before finding the first MIDI device.
> 

Oh crap.  You're right.  For some reason I got mixed up.

regards,
dan carpenter

> 
> Regards,
> Clemens
