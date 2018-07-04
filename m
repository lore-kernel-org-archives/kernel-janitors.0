From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:32 +0000
Subject: Re: [PATCH] net: bgmac: remove redundant variable 'freed'
Message-Id: <20180704.224032.912850817995447050.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704073043.15286-1-colin.king@canonical.com>
In-Reply-To: <20180704073043.15286-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: f.fainelli@gmail.com, scott.branden@broadcom.com, abhishek.shah@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:30:43 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'freed' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'freed' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
