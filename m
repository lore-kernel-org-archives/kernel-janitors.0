From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 03 May 2017 01:58:19 +0000
Subject: Re: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
Message-Id: <20170503015819.GA32111@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170425091949.uindhaxmbtsksqc7@mwanda>
In-Reply-To: <20170425091949.uindhaxmbtsksqc7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, kernel-janitors@vger.kernel.org

On Tue, Apr 25, 2017 at 12:19:49PM +0300, Dan Carpenter wrote:
> We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
> bytes and not sizeof(struct nand_chip) which is a much larger 3056
> bytes.
> 
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git
