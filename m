From: David Miller <davem@davemloft.net>
Date: Wed, 29 Apr 2020 18:44:29 +0000
Subject: Re: [PATCH -next] ptp: ptp_ines: convert to devm_platform_ioremap_resource
Message-Id: <20200429.114429.1348838928565318110.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429075820.103452-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429075820.103452-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: richardcochran@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 07:58:20 +0000

> Use the helper function that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to net-next, thanks.
