From: David Miller <davem@davemloft.net>
Date: Thu, 18 Jul 2019 23:33:04 +0000
Subject: Re: [PATCH] net: dsa: sja1105: Fix missing unlock on error in sk_buff()
Message-Id: <20190718.163304.76416296704116264.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717062956.127446-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717062956.127446-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jul 2019 06:29:56 +0000

> Add the missing unlock before return from function sk_buff()
> in the error handling case.
> 
> Fixes: f3097be21bf1 ("net: dsa: sja1105: Add a state machine for RX timestamping")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
