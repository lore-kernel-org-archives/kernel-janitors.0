From: David Miller <davem@davemloft.net>
Date: Thu, 07 Nov 2019 05:20:35 +0000
Subject: Re: [PATCH v2 -next] ptp: ptp_clockmatrix: Fix missing unlock on error in idtcm_probe()
Message-Id: <20191106.212035.656759378763676850.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106115308.112645-1-weiyongjun1@huawei.com>
        <20191106143309.123196-1-weiyongjun1@huawei.com>
In-Reply-To: <20191106143309.123196-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: richardcochran@gmail.com, vincent.cheng.xh@renesas.com, dan.carpenter@oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 6 Nov 2019 14:33:09 +0000

> Add the missing unlock before return from function idtcm_probe()
> in the error handling case.
> 
> Fixes: 3a6ba7dc7799 ("ptp: Add a ptp clock driver for IDT ClockMatrix.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Vincent Cheng <vincent.cheng.xh@renesas.com>
> ---
> v1 -> v2: fix prefix of subject

Applied, thanks.
