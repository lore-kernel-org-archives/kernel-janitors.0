From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 18 Oct 2006 18:46:55 +0000
Subject: Re: [KJ] [PATCH] OOM killer meets userspace headers
Message-Id: <20061018184655.GC5345@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061018145305.GA5345@martell.zuzino.mipt.ru> <453642D1.1010302@yahoo.com.au>
In-Reply-To: <453642D1.1010302@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Thu, Oct 19, 2006 at 01:05:53AM +1000, Nick Piggin wrote:
> >+#define OOM_ADJUST_MIN (-16)
> >+#define OOM_ADJUST_MAX 15
>
> Why do you need the () for the -ves?

-16 is two tokens. Not that someone is going to do huge arithmetic with
OOM adjustments and screwup himself, but still...
15 is one token, so it's safe.

And if someone from kernel-janitors would go through tree and (without
fanatism) add additional parenthesis to where they belong, it would be
nice.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
