From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Feb 2019 15:38:41 +0000
Subject: Re: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in meson_nfc_select_chip()
Message-Id: <20190205153841.GI2581@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201082922.GC8459@kadam>
 <20190205140818.2de31843@xps13>
In-Reply-To: <20190205140818.2de31843@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Liang Yang <liang.yang@amlogic.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Tue, Feb 05, 2019 at 02:08:18PM +0100, Miquel Raynal wrote:
> > -	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
> > +	if (chip < 0 || WARN_ON_ONCE(chip >= meson_chip->nsels))
> >  		return;
> >  
> >  	nfc->param.chip_select = meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
> 
> I am gonna fold this three patches if this is fine for you with the
> original patch adding the driver which is currently in my next branch.

No problem.

regards,
dan carpenter
