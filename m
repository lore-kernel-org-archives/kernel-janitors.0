From: Roland Dreier <roland@topspin.com>
Date: Tue, 18 Jan 2005 19:06:19 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <52vf9ud0b8.fsf@topspin.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============09975210171327209=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============09975210171327209==
Content-Type: text/plain; charset=us-ascii

    Michael> By the way, I was looking at using RCU to reduce locking,
    Michael> also for thing like poll_cq. What do you say to that?

Unless it's a dramatic speedup, we should avoid RCU because it seems
RCU can only be used with GPL code, not dual GPL/BSD.

 - Roland

--===============09975210171327209==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============09975210171327209==--
