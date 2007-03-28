From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 28 Mar 2007 19:09:25 +0000
Subject: Re: [KJ] [PATCH] BIT macro cleanup
Message-Id: <20070328190925.GC5306@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070328033309.GA9597@arun.site>
In-Reply-To: <20070328033309.GA9597@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

On Wed, Mar 28, 2007 at 09:03:09AM +0530, Milind Arun Choudhary wrote:
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -8,6 +8,9 @@
>   */
>  #include <asm/bitops.h>
>
> +#define BIT(nr)	(1UL << ((nr) % BITS_PER_LONG))

I think this would be a disaster because something like

	BIT(123)

would not even generate a warning.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
