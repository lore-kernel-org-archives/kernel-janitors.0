From: Joe Perches <joe@perches.com>
Date: Sun, 07 Oct 2012 21:39:30 +0000
Subject: Re: [PATCH 13/13] drivers/media/tuners/e4000.c: use macros for i2c_msg initialization
Message-Id: <1349645970.15802.12.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1349624323-15584-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1349624323-15584-3-git-send-email-Julia.Lawall@lip6.fr>
	 <5071AEF3.6080108@bfs.de>
	 <alpine.DEB.2.02.1210071839040.2745@localhost6.localdomain6>
	 <5071B834.1010200@bfs.de>
	 <alpine.DEB.2.02.1210071917040.2745@localhost6.localdomain6>
	 <1349633780.15802.8.camel@joe-AO722>
	 <alpine.DEB.2.02.1210072053550.2745@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1210072053550.2745@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, Antti Palosaari <crope@iki.fi>, kernel-janitors@vger.kernel.org, rmallon@gmail.com, shubhrajyoti@ti.com, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2012-10-07 at 20:56 +0200, Julia Lawall wrote:
> >> Some people thought that it would be nice to have the macros rather than
> >> the inlined field initializations, especially since there is no flag for
> >> write.  A separate question is whether an array of one element is useful,
> >> or whether one should systematically use & on a simple variable of the
> >> structure type.  I'm open to suggestions about either point.
> >
> > I think the macro naming is not great.
> >
> > Maybe add DEFINE_/DECLARE_/_INIT or something other than an action
> > name type to the macro names.
> 
> DEFINE and DECLARE usually have a declared variable as an argument, which 
> is not the case here.
> 
> These macros are like the macros PCI_DEVICE and PCI_DEVICE_CLASS.

I understand that.

> Are READ and WRITE the action names?  They are really the important 
> information in this case.

Yes, most (all?) uses of _READ and _WRITE macros actually
perform some I/O.

> > I think the consistency is better if all the references are done
> > as arrays, even for single entry arrays.
> 
> Is it worth creating arrays where &msg is used?  Or would it be better to 
> leave that aspect as it is?

Reasonable arguments can be made either way.


