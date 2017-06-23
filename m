From: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 23 Jun 2017 17:51:24 +0000
Subject: Re: [PATCH][mtd-next] mtd: parser: print hex size_t value using correct %zx printk format specifier
Message-Id: <20170623175124.GI14148@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623090023.9482-1-colin.king@canonical.com>
 <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
In-Reply-To: <e8cf8fb56ef0b56cca3dce61302a1099@milecki.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Colin King <colin.king@canonical.com>, David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 23, 2017 at 12:02:34PM +0200, Rafał Miłecki wrote:
> On 2017-06-23 11:00, Colin King wrote:
> >From: Colin Ian King <colin.king@canonical.com>
> >
> >Use %zx instead of %X for size_t variable offset, fixes build warning:
> >
> >warning: format '%X' expects argument of type 'unsigned int', but
> >argument
> >2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> >
> >Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> I sent similar patch few hours earlier:
> [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
> https://patchwork.ozlabs.org/patch/779789/
> 
> Brian: you may pick the one with nicer commit message, whichever one you
> prefer :)

I'll go with:
(a) the earlier one and
(b) the one that doesn't change 'X' to 'x'

That means Rafał, you're our lucky winner today! Thanks for playing,
Colin.

Regards,
Brian
