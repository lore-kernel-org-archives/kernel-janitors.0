From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Tue, 18 Jan 2005 18:29:38 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118182938.GE24404@mellanox.co.il>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============016208307938066824=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============016208307938066824==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!
Quoting r. Matthew Wilcox (matthew@wil.cx) "Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups":
> On Tue, Jan 18, 2005 at 09:19:40AM -0800, Roland Dreier wrote:
> >     Matthew> Funny you should mention that.
> > 
> >     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
> >     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
> > 
> >     Matthew> *SLAP*.
> > 
> > ouch ;)
> > 
> > What should those uses of yield() be replaced with?  The loops are
> > polling for pending work to finish up on an exit path, and don't have
> > any strict timing requirements.  cond_resched() seems a bit
> > heavyweight, since we don't need to run for our whole time slice.  We
> > could do msleep(0) or msleep(1) but I don't quite see why that's much
> > of an improvement.
> 
> The semantics of yield() aren't what you, or I, or 2.4 think they should
> be.  Basically, it means "go away, run anything else, even the idle task,
> don't run me again for many seconds".  I think msleep(1) is probably the
> best for this driver, but I'm not sure exactly what semantics you want.

We are brining the interface down, and are polling some locations
to check that it is safe to go away.

mst

--===============016208307938066824==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============016208307938066824==--
