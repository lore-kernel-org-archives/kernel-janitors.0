From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 27 Jul 2011 13:06:03 +0000
Subject: Re: [patch] ALSA: asihpi - off by one in asihpi_hpi_ioctl()
Message-Id: <s5hhb67c1qc.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727120226.GP3824@shale.localdomain>
	<1311771302.2125.7.camel@osiris> <1311771733.2125.9.camel@osiris>
In-Reply-To: <1311771733.2125.9.camel@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Rosenberg <drosenberg@vsecurity.com>
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, "open list:SOUND" <alsa-devel@alsa-project.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

At Wed, 27 Jul 2011 09:02:13 -0400,
Dan Rosenberg wrote:
> 
> 
> > > Also it moved the initialization of "pa" down a couple lines so I'm
> > > concerned there may be a bogus derereference here when we check
> > > pa->type.  I don't have the hardware, so I can't test this.
> > > 
> > 
> > I agree.  This code seems to make assumptions in more than one place
> > that the adapters array is fully populated with non-NULL elements.  At a
> > glance, I can't see where such initialization occurs though.
> > 
> 
> I hadn't read the updated code fully, so I missed what you meant.  Yes,
> this is definitely a NULL dereference, since "pa" is initialized to NULL
> and not changed until after this dereference.

NULL dereference was already fixed today in sound git tree by commit
767cd365b22820df07b962b49ce04b220b98e537.

It'll be included in the pull request in the next days, maybe
tomorrow.


thanks,

Takashi
