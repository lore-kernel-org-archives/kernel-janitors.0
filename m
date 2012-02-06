From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 06 Feb 2012 09:09:51 +0000
Subject: Re: [alsa-devel] [patch] ALSA: hda/realtek - cleanup a condition
Message-Id: <s5hty34qqe8.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120206075218.GA14304@elgon.mountain>
	<4F2F89F3.4060301@canonical.com>
In-Reply-To: <4F2F89F3.4060301@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Henningsson <david.henningsson@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

At Mon, 06 Feb 2012 09:06:11 +0100,
David Henningsson wrote:
> 
> On 02/06/2012 08:52 AM, Dan Carpenter wrote:
> > Sparse complains that "spec->multiout.dac_nids" is a pointer.
> >
> > sound/pci/hda/patch_realtek.c:2321:37: error: incompatible types for operation (>)
> > sound/pci/hda/patch_realtek.c:2321:37:    left side has type unsigned short const [usertype] *dac_nids
> > sound/pci/hda/patch_realtek.c:2321:37:    right side has type int
> >
> > I think the intent here was just to check if it was non-NULL, but please
> > double check.
> 
> It could also have meant to be "if (spec->multiout.num_dacs > 0)", but 
> either way, it seems very unlikely that the condition is false.

Yeah, I think so.  Looks like David can read my old mind better than
me through his crystal ball.

I'll fix it up.  Thanks.


Takashi
