From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Dec 2015 09:01:22 +0000
Subject: Re: [patch] pinctrl: nsp-gpio: forever loop in nsp_gpio_get_strength()
Message-Id: <CACRpkdbr4us-nMUJEv24YASprvHrnzv-dRMpXbrq+MEPuT10Wg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151224072532.GC29642@mwanda>
In-Reply-To: <20151224072532.GC29642@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, kernel-janitors@vger.kernel.org

On Thu, Dec 24, 2015 at 8:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a signedness bug here so the loop will never exit.
>
> Fixes: 8bfcbbbcabe0 ('pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Merry Christmas!
Patch applied.

Yours,
Linus Walleij
