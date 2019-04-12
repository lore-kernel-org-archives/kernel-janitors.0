From: David Miller <davem@davemloft.net>
Date: Fri, 12 Apr 2019 23:56:09 +0000
Subject: Re: [PATCH] qede: fix write to free'd pointer error and double free of ptp
Message-Id: <20190412.165609.2012085988991418522.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190412141327.2122-1-colin.king@canonical.com>
In-Reply-To: <20190412141327.2122-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aelior@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Apr 2019 15:13:27 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The err2 error return path calls qede_ptp_disable that cleans up
> on an error and frees ptp. After this, the free'd ptp is dereferenced
> when ptp->clock is set to NULL and the code falls-through to error
> path err1 that frees ptp again.
> 
> Fix this by calling qede_ptp_disable and exiting via an error
> return path that does not set ptp->clock or kfree ptp.
> 
> Addresses-Coverity: ("Write to pointer after free")
> Fixes: 035744975aec ("qede: Add support for PTP resource locking.")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Also applied, thanks Colin.
