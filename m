From: David Miller <davem@davemloft.net>
Date: Fri, 19 Oct 2018 17:42:40 +0000
Subject: Re: [PATCH net-next] rocker: Drop pointless static qualifier
Message-Id: <20181019.104240.1770877249463990488.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539950579-182423-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539950579-182423-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:02:59 +0000

> There is no need to have the 'struct rocker_desc_info *desc_info'
> variable static since new value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.
