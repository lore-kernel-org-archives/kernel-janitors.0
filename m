From: David Miller <davem@davemloft.net>
Date: Sat, 23 Feb 2019 21:47:50 +0000
Subject: Re: [PATCH net v3] net: set static variable an initial value in atl2_probe()
Message-Id: <20190223.134750.1319881896395311657.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222065723.193392-1-maowenan@huawei.com>
In-Reply-To: <20190222065723.193392-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: kernel-janitors@vger.kernel.org, chris.snook@gmail.com, jcliburn@gmail.com, dan.carpenter@oracle.com, netdev@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 22 Feb 2019 14:57:23 +0800

> cards_found is a static variable, but when it enters atl2_probe(),
> cards_found is set to zero, the value is not consistent with last probe,
> so next behavior is not our expect.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied and queued up for -stable, thanks.
