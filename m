From: Andi Kleen <ak@muc.de>
Date: Mon, 20 Dec 2004 08:04:06 +0000
Subject: Re: [KJ] janitor project: fix gcc 4 warnings
Message-Id: <20041220080406.GB47521@muc.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022326778452770313=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190903.GA30192@muc.de>
In-Reply-To: <20041219190903.GA30192@muc.de>
To: kernel-janitors@vger.kernel.org

--===============022326778452770313==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2004 at 12:15:39AM +0200, Alexey Dobriyan wrote:
> On Sunday 19 December 2004 21:09, Andi Kleen wrote:
> 
> > make allmodconfig
> > make CC=/usr/local/gcc4/bin/gcc 2>&1 | tee LOG
> 
>   CC      kernel/acct.o
> kernel/acct.c: In function ???encode_float???:
> kernel/acct.c:366: fatal error: internal consistency failure
> compilation terminated.

I checked this and it doesn't seem to happen with my compiler
(which is a newer CVS checkout). So I assume it has been fixed already.

-Andi

--===============022326778452770313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022326778452770313==--
