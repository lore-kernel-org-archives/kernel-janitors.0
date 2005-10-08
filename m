From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 08 Oct 2005 18:01:34 +0000
Subject: Re: [KJ] Question re make
Message-Id: <29495f1d0510081101v6da8e1b7va2cc8e9f5d01f51d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200510081802.35521.lkml@oxley.org>
In-Reply-To: <200510081802.35521.lkml@oxley.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/8/05, Felix Oxley <lkml@oxley.org> wrote:
>
> I want to test a fix that I have made to a particular file.
>
> However:
>         # dell:/usr/src/linux-2.6.13.2-2 # make drivers/telephony/ixj.c
>         make: Nothing to be done for `drivers/telephony/ixj.c'.

You are "make"ing an object file, not a .c file. Makefiles' syntax is
for the target, not the source.

make drivers/telephony/ixj.o

> and:
>         # dell:/usr/src/linux-2.6.13.2-2 # make drivers/telephony
>         make: Nothing to be done for `drivers/telephony'.

Please read the Makefile before posting.

make M=drivers/telephony

> and
>         # cc driver/telephony/ixj.cjust gives hundreds of errors.

This is just plain silly and why we have a Makefile system in the first place.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
