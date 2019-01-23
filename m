From: David Miller <davem@davemloft.net>
Date: Wed, 23 Jan 2019 04:09:25 +0000
Subject: Re: [PATCH net-next] devlink: Add missing check of nlmsg_put
Message-Id: <20190122.200925.576430874901041067.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548063293-17855-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548063293-17855-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 21 Jan 2019 09:34:53 +0000

> nlmsg_put may fail, this fix add a check of its return value.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
