From: Roland Dreier <roland@topspin.com>
Date: Tue, 18 Jan 2005 18:10:43 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <52zmz6d2vw.fsf@topspin.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93952449651727488=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============93952449651727488==
Content-Type: text/plain; charset=us-ascii

    Michael> May I put in again my proposal to add a "reset cq" verb,
    Michael> which will make it possible to just reset everything when
    Michael> the interface is going down, without polling, arbitrary
    Michael> timeouts and such.

I still don't understand how this resolves synchronization with
processing that may be in progress on other CPUs, etc.

    Michael> I can build up a patch ...

Perhaps that would be the best way to explain the idea.

 - R.


--===============93952449651727488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93952449651727488==--
