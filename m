From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 03 Mar 2005 23:43:26 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <200503040242.14337.adobriyan@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 03 March 2005 20:36, Nishanth Aravamudan wrote:

> Alexey, I'm curious, do you see a lot of these compile-time warnings with
> the kernel?

No. [i386, ppc64, sparc, x86_64] x [2.6.11-rc5-mm1, 2.6.11, 2.6.11-kj]
contain only one. It seems they are silently fixed in -mm by Andrew.

> In that driver alone I see a handful of other places where 
> dec's and code are mixed.

Not a single one in mcdx.c. Declarations in mcdx_audio_ioctl(), mcdx_talk(),
mcdx_init_drive(), mcdx_readtoc() ... are surrounded with { }. ;-)



	Alexey
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
