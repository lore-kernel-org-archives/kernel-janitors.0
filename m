From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2019 21:09:33 +0000
Subject: Re: [PATCH] pinctl: ti: iodelay: fix error checking on pinctrl_count_index_with_args call
Message-Id: <CACRpkdbQBaZgYBGAAfi7mg+4RMfWovi9io28q4u7KAW44bJ6WQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920122030.14340-1-colin.king@canonical.com>
In-Reply-To: <20190920122030.14340-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tony Lindgren <tony@atomide.com>, YueHaibing <yuehaibing@huawei.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 20, 2019 at 2:20 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The call to pinctrl_count_index_with_args checks for a -EINVAL return
> however this function calls pinctrl_get_list_and_count and this can
> return -ENOENT. Rather than check for a specific error, fix this by
> checking for any error return to catch the -ENOENT case.
>
> Addresses-Coverity: ("Improper use of negative")
> Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
