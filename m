From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 11 May 2017 18:35:52 +0000
Subject: Re: [PATCH] mtd: nand: make nand_ooblayout_lp_hamming_ops static
Message-Id: <20170511183552.GI70297@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170504121100.2709-1-colin.king@canonical.com>
 <20170504160813.23bad4f9@bbrezillon>
In-Reply-To: <20170504160813.23bad4f9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Colin King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 04, 2017 at 04:08:13PM +0200, Boris Brezillon wrote:
> On Thu,  4 May 2017 13:11:00 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > nand_ooblayout_lp_hamming_ops can be made static as it does not need to be
> > in global scope.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, feel free to apply this patch directly if you want, otherwise,
> I'll queue it for 4.13.

Eh, queue it for 4.13, or in a fixes branch if you want.
