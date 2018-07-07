From: David Miller <davem@davemloft.net>
Date: Sat, 07 Jul 2018 11:49:29 +0000
Subject: Re: [PATCH] farsync: remove redundant variable txq_length
Message-Id: <20180707.204929.2298078954908404083.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180707112730.21404-1-colin.king@canonical.com>
In-Reply-To: <20180707112730.21404-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kevin.curtis@farsite.co.uk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat,  7 Jul 2018 12:27:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable txq_length is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'txq_length' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
