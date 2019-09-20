From: Tony Lindgren <tony@atomide.com>
Date: Fri, 20 Sep 2019 14:24:44 +0000
Subject: Re: [PATCH] pinctl: ti: iodelay: fix error checking on pinctrl_count_index_with_args call
Message-Id: <20190920142444.GP5610@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920122030.14340-1-colin.king@canonical.com>
In-Reply-To: <20190920122030.14340-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, YueHaibing <yuehaibing@huawei.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

* Colin King <colin.king@canonical.com> [190920 12:21]:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to pinctrl_count_index_with_args checks for a -EINVAL return
> however this function calls pinctrl_get_list_and_count and this can
> return -ENOENT. Rather than check for a specific error, fix this by
> checking for any error return to catch the -ENOENT case.

Acked-by: Tony Lindgren <tony@atomide.com>
