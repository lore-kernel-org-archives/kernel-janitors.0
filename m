From: Roland Dreier <roland@topspin.com>
Date: Tue, 18 Jan 2005 19:07:58 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <52oefmd08h.fsf@topspin.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47539250668340571=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============47539250668340571==
Content-Type: text/plain; charset=us-ascii

    Matthew> The semantics of yield() aren't what you, or I, or 2.4
    Matthew> think they should be.  Basically, it means "go away, run
    Matthew> anything else, even the idle task, don't run me again for
    Matthew> many seconds".  I think msleep(1) is probably the best
    Matthew> for this driver, but I'm not sure exactly what semantics
    Matthew> you want.

OK, I'll make that change.  Thanks.

 - Roland

--===============47539250668340571==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47539250668340571==--
