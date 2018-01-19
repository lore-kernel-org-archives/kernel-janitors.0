From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jan 2018 19:52:38 +0000
Subject: Re: [PATCH net-next] devlink: Make some functions static
Message-Id: <20180119.145238.1922937467055191863.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516159662-109725-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516159662-109725-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 03:27:42 +0000

> Fixes the following sparse warnings:
> 
> net/core/devlink.c:2297:25: warning:
>  symbol 'devlink_resource_find' was not declared. Should it be static?
> net/core/devlink.c:2322:6: warning:
>  symbol 'devlink_resource_validate_children' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
