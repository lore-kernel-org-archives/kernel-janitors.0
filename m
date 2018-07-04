From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:57 +0000
Subject: Re: [PATCH] net: hns3: remove redundant variable 'protocol'
Message-Id: <20180704.224057.1802700811900019173.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704075925.16163-1-colin.king@canonical.com>
In-Reply-To: <20180704075925.16163-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:59:25 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable 'protocol' is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'protocol' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
