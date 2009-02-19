From: David Miller <davem@davemloft.net>
Date: Thu, 19 Feb 2009 01:49:58 +0000
Subject: Re: [PATCH] drivers/net/sfc: fix sparse warnings: Should it be
Message-Id: <20090218.174958.248510917.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0902160138n255616a0xb963dfd990d912b@mail.gmail.com>
	<20090216095351.391.49056.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090216095351.391.49056.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, bhutchings@solarflare.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 16 Feb 2009 10:54:38 +0100

> Impact: Include the header file.  If CONFIG_SFC_MTD is not defined
> then the functions 'efx_mtd_remove' and 'efx_mtd_rename' are defined
> 'static inline' with an empty function body in the header file, but
> the the whole file mtd.c is not built in this case.
> 
> Fix this sparse warnings:
>   drivers/net/sfc/mtd.c:204:6: warning: symbol 'efx_mtd_remove' was not declared. Should it be static?
>   drivers/net/sfc/mtd.c:221:6: warning: symbol 'efx_mtd_rename' was not declared. Should it be static?
>   drivers/net/sfc/mtd.c:230:5: warning: symbol 'efx_mtd_probe' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied to net-next-2.6, thanks.
