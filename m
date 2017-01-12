From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2017 09:19:26 +0000
Subject: Re: [PATCH 03/18] mtd-cfi_cmdset_0001: Add some spaces for better code readability
Message-Id: <20170112091926.GA15314@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
 <a6f28358-3f8d-180e-9a59-b5ee276cb7d9@users.sourceforge.net>
In-Reply-To: <a6f28358-3f8d-180e-9a59-b5ee276cb7d9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jan 11, 2017 at 09:38:18PM +0100, SF Markus Elfring wrote:
> -		for (i=0; i<cfi->cfiq->NumEraseRegions; i++)
> -			for (j=0; j<cfi->numchips; j++)
> -				kfree(mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap);
> +		for (i = 0; i < cfi->cfiq->NumEraseRegions; i++)
> +			for (j = 0; j < cfi->numchips; j++)
> +				kfree(mtd->eraseregions[j
> +							* cfi->cfiq
> +							  ->NumEraseRegions
> +							+ i].lockmap);

No.

regards,
dan carpenter


