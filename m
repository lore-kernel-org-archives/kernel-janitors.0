From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 Jan 2016 17:58:16 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <20160103175816.GA21611@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
 <56895EE1.7080808@users.sourceforge.net>
In-Reply-To: <56895EE1.7080808@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

On Sun, Jan 03, 2016 at 06:48:17PM +0100, SF Markus Elfring wrote:
> >> Replace explicit initialisation for two local variables at the beginning
> >> by assignments.
> > 
> > Why?
> 
> I prefer that assignments for variables like "card" and "slic_regs"
> will only be performed immediately before the corresponding content will be
> read again (after a few condition checks were executed).
> 
> Another description could be this view:
> I suggest to move the variable initialisation a bit.

And like David Miller and others just said, please don't bother us with
pointless patches such as this, if you keep it up, I'll have to add you
to my killfile as patches like this are a waste of everyone's valuable
time.

greg k-h
