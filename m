From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 10 Aug 2006 00:00:35 +0000
Subject: Re: [KJ] setting up a cross compilation environment in x86_64
Message-Id: <Pine.LNX.4.58.0608091659480.19626@shark.he.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10608091600y6eec7641h7f194daab6df99d9@mail.gmail.com>
In-Reply-To: <6b4e42d10608091600y6eec7641h7f194daab6df99d9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 9 Aug 2006, Om. wrote:

> Hi,
> I have a AMD64 machine which runs fedora core 5. I want to set up
> gcc32 and binutils so that I can compile my patches for both AMD64 as
> well as IA32 kernels. Is there any easy way of doing it (short of
> kegel's cross tool and compiling gcc 32bit version)?

What I do is download the pre-built toolchain(s) from
  http://developer.osdl.org/dev/plm/cross_compile/
and use those.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
