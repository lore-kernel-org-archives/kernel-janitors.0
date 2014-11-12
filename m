From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 12 Nov 2014 21:40:34 +0000
Subject: Re: [PATCH v2 1/2] staging: rtl8188eu: Deletion of unnecessary checks before three function calls
Message-Id: <alpine.DEB.2.02.1411122237380.2055@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <544954FD.8040607@users.sourceforge.net>
 <20141029084702.GA18675@kroah.com> <5453CD0D.9010206@users.sourceforge.net>
 <alpine.DEB.2.10.1410311900201.2481@hadrien>
 <5463C10D.6020409@users.sourceforge.net>
 <5463C22B.7060405@users.sourceforge.net> <20141112211815.GJ6749@mwanda>
 <5463D109.4020702@users.sourceforge.net>
In-Reply-To: <5463D109.4020702@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> > This is especially true if you have trained yourself to know that
> > free_netdev() can't accept NULL pointers.
> 
> Do you need to adjust your concerns a bit over time when function variants
> provide a corresponding safety check in their implementations?

There would not seem to be any _need_ to do so.  An unnecessary null test 
is always safe.  The only real problem that I can see with an unnecessary 
null test in error handling code (intrinsically not critical performance 
wise) is if it gives the illusion that a value can be null when it cannot.

julia
