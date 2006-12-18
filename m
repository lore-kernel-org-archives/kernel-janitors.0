From: David Miller <davem@davemloft.net>
Date: Mon, 18 Dec 2006 01:11:59 +0000
Subject: Re: [KJ] [PATCH] he: tiny space savings
Message-Id: <20061217.171159.32723537.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061217125622.GA4973@martell.zuzino.mipt.ru>
In-Reply-To: <20061217125622.GA4973@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adobriyan@gmail.com
Cc: netdev@vger.kernel.org, webmaster@programmierforen.de, kernel-janitors@lists.osdl.org, bunk@stusta.de

From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 17 Dec 2006 15:56:22 +0300

> From: Andi Drebes <webmaster@programmierforen.de>
> 
>    text    data     bss     dec     hex filename
>   20015     480      28   20523    502b drivers/atm/he.o
>   19997     480      28   20505    5019 drivers/atm/he.o
> 
> Signed-off-by: Andi Drebes <webmaster@programmierforen.de>
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

As Adrian said, this CVS string is totally useless.

That being said, it should be replaced with an
appropriate piece of versioning information, like
the ones we use via MODULE_VERSION() in other drivers.

I'll be happy to apply a patch which gets rid of the
CVS references, and replaces it with something useful.

Thanks.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
