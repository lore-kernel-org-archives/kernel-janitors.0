From: Greg KH <greg@kroah.com>
Date: Thu, 23 Feb 2006 17:45:18 +0000
Subject: Re: [KJ][Patch] fix coding style in fscpos.c
Message-Id: <20060223174518.GD32692@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92329621364907299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140611727.7778.8.camel@localhost.localdomain>
In-Reply-To: <1140611727.7778.8.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============92329621364907299==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 23, 2006 at 09:57:36AM +0100, Jean Delvare wrote:
> 
> Hi Adrian,
> 
> On 2006-02-23, Adrian Bunk wrote:
> > > >  	/* Range: 0..255 */
> > > > -	if (v < 0) v = 0;
> > > > -	if (v > 255) v = 255;
> > > > +	if (v < 0)
> > > > +		v = 0;
> > > > +	if (v > 255)
> > > > +		v = 255;
> > >
> > > Not worth the effort IMHO. The original code is pretty readable as it
> > > is so I wouldn't change it.
> >
> > It's against the kernel coding style.
> >
> > There many several cases with several ways to express something pretty
> > readable (opening braces being an religious example), but the goal is
> > to stick with one way to express something throughout the whole kernel.
> 
> I didn't mean to say otherwise. I request submitters of new drivers and
> patches to comply with CodingStyle and even with the kernel guide to
> space. I'm quite picky about it actually, just ask these submitters and
> they'll tell you. I also wholeheartedly accept a cleanup patch,
> including coding style, as the first patch of a patchset improving any
> given driver, as it makes the next patches easier to work on and review.
> 
> However, I don't see much benefit in patches randomly fixing one coding
> style mistake in a random driver, unless that mistake was making the
> code especially unclear or error prone. The overhead to my workload and
> in the driver history is simply not worth the gain. This was the meaning
> of my reply.

That's exactly the point of the janitor project, to make changes like
this in places where needed.

Here, this is needed :)

thanks,

greg k-h

--===============92329621364907299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92329621364907299==--
