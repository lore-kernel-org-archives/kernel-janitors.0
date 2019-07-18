From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 18 Jul 2019 17:24:54 +0000
Subject: Re: [PATCH] net: dsa: sja1105: Fix missing unlock on error in sk_buff()
Message-Id: <fd5f3779-f28f-f5f3-c18d-76fdecb47239@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717062956.127446-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717062956.127446-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/16/19 11:29 PM, Wei Yongjun wrote:
> Add the missing unlock before return from function sk_buff()
> in the error handling case.
> 
> Fixes: f3097be21bf1 ("net: dsa: sja1105: Add a state machine for RX timestamping")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
