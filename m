From: Greg KH <greg@kroah.com>
Date: Thu, 20 Jan 2005 17:11:19 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050120171118.GA9538@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26272583536189642=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============26272583536189642==
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

Sure, but then no one can then take that code and use it under the BSD
license in the future, due to the dependancy on the RCU code, which is
_only_ allowed to be used under the GPL.

That's the main reason the openib people object to this, it has nothing
to do with the in-kernel code at all.

Personally, I think it's a stupid thing to try to license this code in a
dual way, as any port someone is going to have to do to get this code to
work in another os will be almost a complete rewrite in the end
anyway...

thanks,

greg k-h

--===============26272583536189642==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26272583536189642==--
