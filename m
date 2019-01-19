From: David Miller <davem@davemloft.net>
Date: Sat, 19 Jan 2019 18:30:35 +0000
Subject: Re: [PATCH net-next] net: usb: rtl8150: remove set but not used variable 'rx_stat'
Message-Id: <20190119.103035.1986037593018345074.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547777209-92367-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547777209-92367-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: petkan@nucleusys.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 18 Jan 2019 02:06:49 +0000

> From: Yue Haibing <yuehaibing@huawei.com>
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/usb/rtl8150.c: In function 'read_bulk_callback':
> drivers/net/usb/rtl8150.c:391:6: warning:
>  variable 'rx_stat' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Applied.
