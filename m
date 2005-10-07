From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Fri, 07 Oct 2005 15:07:30 +0000
Subject: Re: [KJ] Fixing:  char *foo = "blah";
Message-Id: <20051007120730.3c3f27b8.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45846634865669045=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200510071234.04923.lkml@oxley.org>
In-Reply-To: <200510071234.04923.lkml@oxley.org>
To: kernel-janitors@vger.kernel.org

--===============45846634865669045==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  Felix Oxley <lkml@oxley.org>
Sent on  Fri, 7 Oct 2005 12:34:03 +0100

Hello,

> I plan to take on this task as described at:
> 			http://www.kerneljanitors.org/TODO
> I have a number of queries:
> 
> 1. 	I presume that the [brackets] indicate that const is optional.
> 	Therefore the following needs correcting:
> 		char *foo = "blah";
> 
> 2.	I suppose that the following form would also need correcting:
> 		static const char *foo = "blah"
> 
> 3.	Does the following (with an empty string) need correcting?
> 		[const] char *foo = "";
> 
> 4. 	What about this?
> 		static const char *class_name[] =
> { "off","UBR","CBR","VBR","ABR" };
> 
> 
> 5. 	These changes are spread across the kernel code.
> 	Do patches need to be submitted to individual subsystem
> maintainers, or will a single patch be ok?

By May, 2005, I was working on this.  Alexey told me that besides what gcc
should do, I had to confirm that the change made was actually better.

In some cases, it was not.  I've made a testcase, and the results were
pretty odd (I was expecting something else):

http://lists.osdl.org/pipermail/kernel-janitors/2005-May/004146.html

Different versions of gcc and cross-compilers should produce different
results.  I really don't know yet what is the best case (ie, which is good
for (almost) all architectures/compilers).

Anyone?

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

  Left to themselves, things tend to go from bad to worse.

--===============45846634865669045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45846634865669045==--
