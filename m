From: Greg KH <greg@kroah.com>
Date: Fri, 21 Jan 2005 06:48:52 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050121064852.GD19288@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20186259282877161=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============20186259282877161==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 09:35:59PM -0700, Ronald G. Minnich wrote:
> On Thu, 20 Jan 2005, Grant Grundler wrote:
> > I think you overlooked the fact that include/linux/rcupdate.h is
> > published under the GPL. Not "dual GPL/BSD". Someone can't take code
> > that uses linux's RCU and ship it under a BSD license. There are
> > "consumers" of openib.org that want to do that. ergo we can't use RCU
> > unless they are willing to give that up.
> 
> Does this open up the possibility of a GPL-only "fork" in the code, i.e. 
> somebody:
> - takes the code, and puts it in another repo somewhere
> - adds in RCU
> - makes it available to others but only under GPL due to RCU inclusion
> - now we have an openib fork that is GPL by definition, that can't be 
>   BSD due to inclusion of RCU?

Or:
	- someone gets a GPL only license file added to the openib code
	  base in the linux kernel, by slipping it in through another
	  path to Linus.

Odds are, that's going to happen before the above does :)

Remember, the openib code uses functions that are marked
EXPORT_SYMBOL_GPL() and if _anyone_ violates those markings by trying to
ship a openib derivative work with a non-gpl license, they will be hearing
from some lawyers very quickly.

> Seems almost inevitable as soon as people really want "Feature XYZ" from 
> Linux in their openib code base.

And as more and more "feature xyz" in the kernel are being marked GPL
only, it's only a matter of time...

greg k-h

--===============20186259282877161==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20186259282877161==--
