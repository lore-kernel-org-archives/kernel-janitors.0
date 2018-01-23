From: David Miller <davem@davemloft.net>
Date: Tue, 23 Jan 2018 16:17:25 +0000
Subject: Re: [PATCH] bnx2: remove redundant initializations of pointers txr and rxr
Message-Id: <20180123.111725.1910125353313770902.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123094408.30366-1-colin.king@canonical.com>
In-Reply-To: <20180123094408.30366-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: rasesh.mody@cavium.com, harish.patil@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jan 2018 09:44:08 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointers txr and rxr are being initialized and a few statements later
> are being assigned new values without the original values ever being
> read. The initialized values are therefore redundant and can be
> removed.
> 
> Cleans up clang warnings:
> drivers/net/ethernet/broadcom/bnx2.c:5821:28: warning: Value stored to
> 'txr' during its initialization is never read
> drivers/net/ethernet/broadcom/bnx2.c:5822:28: warning: Value stored to
> 'rxr' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
