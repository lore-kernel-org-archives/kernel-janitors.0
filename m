From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 01 Feb 2019 14:00:33 +0000
Subject: Re: [PATCH -next] gpio: tqmx86: Drop unnecessary gpiochip_remove in tqmx86_gpio_probe()
Message-Id: <20190201140033.GD30908@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201091841.152704-1-weiyongjun1@huawei.com>
In-Reply-To: <20190201091841.152704-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 01, 2019 at 09:18:41AM +0000, Wei Yongjun wrote:
> It's not necessary to remove gpio_chip which added with
> devm_gpiochip_add_data().
> 
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
