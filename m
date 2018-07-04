From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:41:03 +0000
Subject: Re: [PATCH] net: hinic: remove redundant pointer pfhwdev
Message-Id: <20180704.224103.592762620385074395.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704080627.16393-1-colin.king@canonical.com>
In-Reply-To: <20180704080627.16393-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 09:06:27 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer pfhwdev is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'pfhwdev' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
