From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:08 +0000
Subject: Re: [PATCH] ethernet: micrel: remove redundant pointer 'info'
Message-Id: <20180704.224108.2162570593263695417.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704112044.7930-1-colin.king@canonical.com>
In-Reply-To: <20180704112044.7930-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 12:20:44 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'info' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'info' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
