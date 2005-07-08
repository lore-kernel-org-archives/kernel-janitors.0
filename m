From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 08 Jul 2005 20:33:57 +0000
Subject: Re: [KJ] [PATCH] drivers/ide/ide-tape.c : Use of time_after macro
Message-Id: <200507090033.58268.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CED33B.4000600@feitoza.com.br>
In-Reply-To: <42CED33B.4000600@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 08 July 2005 23:25, Marcelo Feitoza Parisi wrote:
> Use of the time_after() macro, defined at linux/jiffies.h, which deal
> with wrapping correctly and are nicer to read.

OK, you're using Thunderbird, but at least include description of what patch
does into attachment.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
