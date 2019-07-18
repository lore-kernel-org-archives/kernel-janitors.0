From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Thu, 18 Jul 2019 16:42:40 +0000
Subject: Re: [PATCH] net: dsa: sja1105: Fix missing unlock on error in sk_buff()
Message-Id: <20190718124240.GB5644@t480s.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717062956.127446-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717062956.127446-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 17 Jul 2019 06:29:56 +0000, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Add the missing unlock before return from function sk_buff()
> in the error handling case.
> 
> Fixes: f3097be21bf1 ("net: dsa: sja1105: Add a state machine for RX timestamping")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Vivien Didelot <vivien.didelot@gmail.com>
