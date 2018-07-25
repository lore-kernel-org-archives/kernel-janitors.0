From: <Bryan.Whitehead@microchip.com>
Date: Wed, 25 Jul 2018 16:42:35 +0000
Subject: RE: [PATCH net-next] lan743x: Make symbol lan743x_pm_ops static
Message-Id: <90A7E81AE28BAE4CBDDB3B35F187D2644073BF73@CHN-SV-EXMX02.mchp-main.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532499076-191548-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532499076-191548-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> Subject: [PATCH net-next] lan743x: Make symbol lan743x_pm_ops static
> 
> Fixes the following sparse warning:
> 
> drivers/net/ethernet/microchip/lan743x_main.c:2944:25: warning:
>  symbol 'lan743x_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Bryan Whitehead <Bryan.Whitehead@microchip.com>

