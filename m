From: MJK <mkemp@cs.nmsu.edu>
Date: Sat, 29 May 2004 23:11:37 +0000
Subject: Re: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405291659170.4472@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48941119072251227=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============48941119072251227==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	Gotcha.

sa.c, rkt.c:

	Cleaned up code for error handing. Added checks to unmap memory,
release IRQ's, and freeing up dev->queue.

	Cleaned up code for error handing. Added checks to unmap memory,
release IRQ's, and freeing up dev->queue.

rx.c:
	Cleaned up error handling for releasing IRQ's, unmapping memory
and freeing device memory (dev->queues). Also, audited kernel_thread() and
took appropriate action for failure.

On Sat, 29 May 2004, Randy.Dunlap wrote:

> Now what it needs (IMO of course, but this comes from sending lots
> of patches to Andrew and getting feedback on them) is a more
> descriptive subject: line and description (in the email body)
> of what/why the patch is/does.  Otherwise the patchset maintainer
> will have to generate all of that when the patch is forwarded,
> and s/he shouldn't have to do that extra bit.

--===============48941119072251227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48941119072251227==--
