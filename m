From: "Michael S. Tsirkin" <mst@mellanox.co.il>
Date: Tue, 18 Jan 2005 18:16:40 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118181640.GB24404@mellanox.co.il>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21868948629805551=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============21868948629805551==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!
Quoting r. Roland Dreier (roland@topspin.com) "Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups":
>     Michael> May I put in again my proposal to add a "reset cq" verb,
>     Michael> which will make it possible to just reset everything when
>     Michael> the interface is going down, without polling, arbitrary
>     Michael> timeouts and such.
> 
> I still don't understand how this resolves synchronization with
> processing that may be in progress on other CPUs, etc.

By the way, I was looking at using RCU to reduce locking, also for
thing like poll_cq. What do you say to that?

>     Michael> I can build up a patch ...
> 
> Perhaps that would be the best way to explain the idea.
> 
>  - R.

okay
mst

--===============21868948629805551==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21868948629805551==--
