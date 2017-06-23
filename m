From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Date: Fri, 23 Jun 2017 10:02:34 +0000
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using correct %zx printk format specifier
Message-Id: <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623090023.9482-1-colin.king@canonical.com>
In-Reply-To: <20170623090023.9482-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2017-06-23 11:00, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Use %zx instead of %X for size_t variable offset, fixes build warning:
> 
> warning: format '%X' expects argument of type 'unsigned int', but 
> argument
> 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I sent similar patch few hours earlier:
[PATCH] mtd: parsers: trx: fix pr_err format for printing offset
https://patchwork.ozlabs.org/patch/779789/

Brian: you may pick the one with nicer commit message, whichever one you
prefer :)
