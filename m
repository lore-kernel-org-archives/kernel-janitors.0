From: MJK <mkemp@cs.nmsu.edu>
Date: Sat, 29 May 2004 01:59:12 +0000
Subject: Re: [Kernel-janitors] [PATCH] kernel_thread() audit
Message-Id: <Pine.LNX.4.58.0405281958400.31854@mustang.cs.nmsu.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44590336220058147=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
In-Reply-To: <Pine.LNX.4.58.0405202047020.9107@mustang.cs.nmsu.edu>
To: kernel-janitors@vger.kernel.org

--===============44590336220058147==
Content-Type: TEXT/PLAIN; charset=US-ASCII


	*Salutes*

On Fri, 28 May 2004, Randy.Dunlap wrote:

> Yes.  Each return path needs to deallocate/free whatever has been
> allocated up to that point.  However, don't duplicate code at
> each return point.  At the first return point, use something like
> 'goto err_reason1;' and do whatever needs to be done there.
> At the second return point, use 'goto err_reason2;' and do what
> needs to be done there, and then fall thru to the <reason1> code.
> (and use meaningful names for the reasons.)
>
> There are plenty of examples of error-handling code like this if
> you have problems with it.
>
> Then after rx.c is done, rkt.c and sa.c need to the same treatments... :)

--===============44590336220058147==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44590336220058147==--
