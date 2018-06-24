From: David Miller <davem@davemloft.net>
Date: Sun, 24 Jun 2018 14:08:38 +0000
Subject: Re: [PATCH] sfc: make function efx_rps_hash_bucket static
Message-Id: <20180624.230838.2241496969600134788.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180624105731.5167-1-colin.king@canonical.com>
In-Reply-To: <20180624105731.5167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 24 Jun 2018 11:57:31 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function efx_rps_hash_bucket is local to the source and
> does not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'efx_rps_hash_bucket' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
