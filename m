From: David Miller <davem@davemloft.net>
Date: Fri, 25 Aug 2017 04:48:34 +0000
Subject: Re: [PATCH net-next] hinic: uninitialized variable in hinic_api_cmd_init()
Message-Id: <20170824.214834.959375646627489858.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824104739.gw422ufydwmiu4gi@mwanda>
In-Reply-To: <20170824104739.gw422ufydwmiu4gi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 13:47:39 +0300

> We never set the error code in this function.
> 
> Fixes: eabf0fad81d5 ("net-next/hinic: Initialize api cmd resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
