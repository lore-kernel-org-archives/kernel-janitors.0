From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Tue, 18 Jan 2005 18:05:05 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118180505.GA24404@mellanox.co.il>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68303033595450513=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============68303033595450513==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!
Quoting r. Roland Dreier (roland@topspin.com) "Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups":
>     Matthew> Funny you should mention that.
> 
>     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
>     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
> 
>     Matthew> *SLAP*.
> 
> ouch ;)
> 
> What should those uses of yield() be replaced with?  The loops are
> polling for pending work to finish up on an exit path, and don't have
> any strict timing requirements.  cond_resched() seems a bit
> heavyweight, since we don't need to run for our whole time slice.  We
> could do msleep(0) or msleep(1) but I don't quite see why that's much
> of an improvement.
> 
> Thanks,
>   Roland

The reason we have this and not just closing the qp is because
we dont want to change the qp number, right?

May I put in again my proposal to add a "reset cq" verb, which will make
it possible to just reset everything when the interface is going down,
without polling, arbitrary timeouts and such.

I can build up a patch ...
MST

--===============68303033595450513==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68303033595450513==--
