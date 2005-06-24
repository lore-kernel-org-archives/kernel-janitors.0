From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 24 Jun 2005 15:40:27 +0000
Subject: Re: [KJ] [PATCH] Balanced io{re|un}map : drivers/char/moxa.c
Message-Id: <200506241940.27875.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050624085203.GF5023@rhum.iomeda.fr>
In-Reply-To: <20050624085203.GF5023@rhum.iomeda.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 24 June 2005 12:52, Christophe Lucas wrote:
> Make sure calls to certain functions are matched by the relevant function 
> at other end of the function, and also during ALL failure/early return paths.

> --- 2.6.12-orig/drivers/char/moxa.c
> +++ 2.6.12/drivers/char/moxa.c
> @@ -492,6 +492,10 @@ static void __exit moxa_exit(void)

> +	for (i = 0; i < numBoards; i++) {
> +		iounmap((void __iomem *) moxaBaseAddr[i]);
> +	}
> +

No need for cast and for {}.

static void __iomem *moxaBaseAddr[MAX_BOARDS];

Oh, and it won't compile.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
