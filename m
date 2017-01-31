From: Richard Weinberger <richard@nod.at>
Date: Tue, 31 Jan 2017 16:39:41 +0000
Subject: Re: [PATCH] mtd: spi-nor: cqspi: remove redundant dead code on error return check
Message-Id: <630cf780-6cf5-ff5d-1a83-e360074483b4@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170131155317.20106-1-colin.king@canonical.com>
In-Reply-To: <20170131155317.20106-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 31.01.2017 um 16:53 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Checking for ret < 0 is redundant because a previous check on ret
> being non-zero already handles the ret < 0 case. Remove the redundant
> code. Found by CoverityScan, CID#1398863, CID#1398864
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
