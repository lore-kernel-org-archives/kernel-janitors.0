From: Grant Grundler <iod00d@hp.com>
Date: Thu, 20 Jan 2005 17:19:23 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050120171923.GI13299@esmail.cup.hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70017442690783738=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============70017442690783738==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 06:02:36PM +0100, Adrian Bunk wrote:
> On Tue, Jan 18, 2005 at 11:06:19AM -0800, Roland Dreier wrote:
> >     Michael> By the way, I was looking at using RCU to reduce locking,
> >     Michael> also for thing like poll_cq. What do you say to that?
> > 
> > Unless it's a dramatic speedup, we should avoid RCU because it seems
> > RCU can only be used with GPL code, not dual GPL/BSD.
> 
> "dual GPL/BSD" means you can choose whether you want to use the code 
> under the GPL or under a BSD licence.
> 
> Therefore, it's simply GPL code.

Adrian,
I think you overlooked the fact that include/linux/rcupdate.h is published
under the GPL. Not "dual GPL/BSD". Someone can't take code that uses
linux's RCU and ship it under a BSD license.
There are "consumers" of openib.org that want to do that.
ergo we can't use RCU unless they are willing to give that up.

> And even in the other case, the 3-clause BSD licence is compatible with 
> the GPL.

Sorry - I'm no lawyer. I've never heard of "3-clause BSD" and that's
probably a good thing. I fail to see the point of something that's
compatible with GPL since one could just use GPL in that case.

grant

--===============70017442690783738==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70017442690783738==--
