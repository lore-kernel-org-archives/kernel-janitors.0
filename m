From: David Miller <davem@davemloft.net>
Date: Thu, 07 May 2020 20:06:10 +0000
Subject: Re: [net-next] net:enetc: bug fix for qos sfi operate space after freed
Message-Id: <20200507.130610.2218488895332459354.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507105738.29961-1-Po.Liu@nxp.com>
In-Reply-To: <20200507105738.29961-1-Po.Liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Po.Liu@nxp.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, dan.carpenter@oracle.com, claudiu.manoil@nxp.com

From: Po Liu <Po.Liu@nxp.com>
Date: Thu,  7 May 2020 18:57:38 +0800

> 'Dan Carpenter' reported:
> This code frees "sfi" and then dereferences it on the next line:
>>                 kfree(sfi);
>>                 clear_bit(sfi->index, epsfp.psfp_sfi_bitmap);
> 
> This "sfi->index" should be "index".
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Po Liu <Po.Liu@nxp.com>

Applied.
