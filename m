From: David Miller <davem@davemloft.net>
Date: Thu, 01 Feb 2018 14:43:17 +0000
Subject: Re: [PATCH] be2net: remove redundant initialization of 'head' and pointer txq
Message-Id: <20180201.094317.1226307518693749272.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180131161425.15011-1-colin.king@canonical.com>
In-Reply-To: <20180131161425.15011-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: sathya.perla@broadcom.com, ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com, somnath.kotur@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jan 2018 16:14:25 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable head is initialized to a value that is never read and is
> being updated to a new value a few lines later, hence this
> initialization is redundant and can be safely removed as well
> as the now unused pointer txq.
> 
> Cleans up clang warning:
> drivers/net/ethernet/emulex/benet/be_main.c:996:6: warning: Value
> stored to 'head' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
