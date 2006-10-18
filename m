From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 18 Oct 2006 19:24:04 +0000
Subject: Re: [KJ] [PATCH] OOM killer meets userspace headers
Message-Id: <20061018192404.GE5345@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061018145305.GA5345@martell.zuzino.mipt.ru> <453642D1.1010302@yahoo.com.au> <20061018184655.GC5345@martell.zuzino.mipt.ru> <45367C93.3040804@yahoo.com.au>
In-Reply-To: <45367C93.3040804@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Thu, Oct 19, 2006 at 05:12:19AM +1000, Nick Piggin wrote:
> Alexey Dobriyan wrote:
> >On Thu, Oct 19, 2006 at 01:05:53AM +1000, Nick Piggin wrote:
> >
> >>>+#define OOM_ADJUST_MIN (-16)
> >>>+#define OOM_ADJUST_MAX 15
> >>
> >>Why do you need the () for the -ves?
> >
> >
> >-16 is two tokens. Not that someone is going to do huge arithmetic with
> >OOM adjustments and screwup himself, but still...
> 
> How can they screw themselves up? AFAIKS, the - directly to the left
> of the literal will bind more tightly than any other valid operator.

Hmmm... c.l.c lists two reasons: a) =- being synonym of -= in pre-ANSI
days, and b) fat fingers

	#define EOF -1
	while ((c = getchar()) != 3 EOF)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
