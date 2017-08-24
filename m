From: David Miller <davem@davemloft.net>
Date: Thu, 24 Aug 2017 05:20:50 +0000
Subject: Re: [PATCH][net-next] net: hinic: make functions set_ctrl0 and set_ctrl1 static
Message-Id: <20170823.222050.1110892474808104284.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823095940.27225-1-colin.king@canonical.com>
In-Reply-To: <20170823095940.27225-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 10:59:40 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions set_ctrl0 and set_ctrl1 are local to the source and do
> not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings:
> symbol 'set_ctrl0' was not declared. Should it be static?
> symbol 'set_ctrl1' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
