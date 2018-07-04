From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:28 +0000
Subject: Re: [PATCH] epic100: remove redundant variable 'irq'
Message-Id: <20180704.224128.1113173121758075488.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704121929.9113-1-colin.king@canonical.com>
In-Reply-To: <20180704121929.9113-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: allen.lkml@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 13:19:29 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'irq' is being assigned but is never used hence it is
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'irq' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
