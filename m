From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sun, 20 Nov 2005 16:57:23 +0000
Subject: Re: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <29495f1d0511200857l3be61e10s32f9b311b5020563@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437E8107.2000103@nhw.pl>
In-Reply-To: <437E8107.2000103@nhw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/20/05, Witold Rugowski <rugowski@nhw.pl> wrote:
> Nish Aravamudan wrote:
> > Missing spaces?
>
> Yes. But that was my first time ;-)) so - improved patch version follows:

No problem. You need to provide a description and Signed-off-by line
with every patch, though, to make the maintainer's job easier.

Otherwise looks ok, except you're patching an obsolete subsystem
(OSS). I wouldn't bother.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
