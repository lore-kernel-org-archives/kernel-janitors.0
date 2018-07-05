From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 11:08:06 +0000
Subject: Re: [PATCH][V2] net: ethernet: sun: remove redundant variables adv and lpa and mii_reads
Message-Id: <20180705.200806.175025399999006514.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705110525.27231-1-colin.king@canonical.com>
In-Reply-To: <20180705110525.27231-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Jul 2018 12:05:25 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables adv and lpa are being assigned but are never used hence they
> are redundant and can be removed.  Also remove the unncessary mii_reads
> too.
> 
> Cleans up clang warnings:
> warning: variable 'lpa' set but not used [-Wunused-but-set-variable]
> warning: variable 'adv' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: remove mii_reads as suggessted by Dan Carpenter and David Miller

Applied, thanks Colin.
