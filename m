From: Libor Michalek <libor@topspin.com>
Date: Fri, 21 Jan 2005 17:57:39 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050121095739.A4382@topspin.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50379952963958807=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============50379952963958807==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 09:22:56AM -0800, Roland Dreier wrote:
>     Ronald> this keeps getting more and more interesting. For example,
>     Ronald> now that the code is in the kernel, is there any need to
>     Ronald> maintain the openib tree?
> 
> Independent of any licensing questions, there definitely is a real
> need to have an external repository for development.  We need a place
> to test and debug code and coordinate development before sending
> patches on.

  Plus there is software which interacts with the OpenIB kernel code,
that is not intended or appropriate for kernel submission. (e.q. user
space access, OpenSM, etc.)

  I seem to remember that the license was the result of getting the
member companies to open their exisiting software. There was concern
since some of that software was already licensed to third parties
under non-GPL licenses. I think we can certainly revisit the issue
for all the gen2 software which is being written from scratch.

-Libor

--===============50379952963958807==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50379952963958807==--
