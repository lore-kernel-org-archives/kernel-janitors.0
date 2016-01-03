From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 Jan 2016 19:45:22 +0000
Subject: Re: [PATCH] staging-slicoss: Replace variable initialisations by assignments in slic_if_init()
Message-Id: <20160103194522.GA31644@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56894D2D.1010801@users.sourceforge.net>
 <alpine.DEB.2.02.1601031741080.2074@localhost6.localdomain6>
 <56895EE1.7080808@users.sourceforge.net>
 <20160103175816.GA21611@kroah.com>
 <56896591.2030208@users.sourceforge.net>
 <20160103182640.GA30692@kroah.com>
 <56896D6A.6020309@users.sourceforge.net>
In-Reply-To: <56896D6A.6020309@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

On Sun, Jan 03, 2016 at 07:50:18PM +0100, SF Markus Elfring wrote:
> >> I am a bit surprised that you do not like such source code fine-tuning.
> > 
> > It's moving stuff around for no real reason, why would I like it?
> 
> Can such fine-tuning result in positive effects for the run-time behaviour?

If you can not benchmark and show the proof, don't even start to claim
such a thing.

> > Did you speed up the code in a measurable way?
> 
> My suggestions can result in measurable differences.

Show the proof please.  That's the only way I will ever accept anything
else from you like this.

> Will it become acceptable to reduce the scope for any more variable
> definitions in further function implementations?

No.

> > Code in staging needs to be moved out of staging, and this patch does
> > nothing toward achieving that goal and it wastes people's time reviewing
> > it to see if it is correct or not.
> 
> I am curious on the ways the discussed software can evolve further.

That's nice, but that's not my concern.

greg k-h
