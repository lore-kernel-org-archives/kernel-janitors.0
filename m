From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:23 +0000
Subject: Re: [PATCH] sfc: remove redundant variable old_vlan
Message-Id: <20180704.224123.1814778518055648050.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704121301.8896-1-colin.king@canonical.com>
In-Reply-To: <20180704121301.8896-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 13:13:01 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable old_vlan is being assigned but is never used hence it is
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'old_vlan' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
