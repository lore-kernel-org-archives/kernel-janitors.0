From: Henk Vergonet <rememberme@god.dyndns.org>
Date: Sun, 23 Oct 2005 21:39:30 +0000
Subject: Re: [KJ] [PATCH] Hex digits consolidation patch
Message-Id: <20051023213930.GA20879@god.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============049036298740865458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051011171923.GA5766@masoud.ir>
In-Reply-To: <20051011171923.GA5766@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============049036298740865458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2005 at 01:19:24PM -0400, Masoud Sharbiani wrote:
> Hello, 
> The following patch consolidates all definitions of hex digits in ASCII chars in one place. For some reason, size of vmlinux increases by 791 bytes. Both images were 2.6.14-rc4 based. Both of them were complied on the same machine, with their .config being made from 'make allyesconfig.'
> 

The only thing I can think of is compiler optimalisations.
Try to run objdump -D on a few objects with hex conversions in order to see 
the difference in code generation.

My 2 cents.

Regards

--===============049036298740865458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============049036298740865458==--
