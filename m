From: Nicolas Kaiser <nikai@nikai.net>
Date: Fri, 13 Oct 2006 13:05:18 +0000
Subject: Re: [KJ] [PATCH] include/asm-i386/a.out.h: Comment correction
Message-Id: <20061013150518.4674648f@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610111811.21503.lists-receive@programmierforen.de>
In-Reply-To: <200610111811.21503.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* Andi Drebes <lists-receive@programmierforen.de>:
> The header is protected against double inclusion. The comment
> at the end didn't match the preprocessor definition used at
> the top.

I just spotted another two of these, in include/net/ip_fib.h
and arch/ppc/boot/include/serial.h. Are you currently working
on more of these?

Cheers,
n.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
