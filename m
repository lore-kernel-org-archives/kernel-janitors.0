From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:27 +0000
Subject: Re: [PATCH] net: ethernet: nb8800: remove redundant pointer rxd
Message-Id: <20180704.224027.884051885587782041.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704072020.14785-1-colin.king@canonical.com>
In-Reply-To: <20180704072020.14785-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: marc_gonzalez@sigmadesigns.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:20:20 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer rxd is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'rxb' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
