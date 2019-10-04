From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2019 22:14:14 +0000
Subject: Re: [PATCH] ns2: Fix off by one bugs in ns2_pinmux_enable()
Message-Id: <CACRpkdY6f5MX16cJL--D3O=_4us=vXEF6vWfRpd+ju8T_JsE0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081426.GB2332@mwanda>
In-Reply-To: <20190926081426.GB2332@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ray Jui <rjui@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Sep 26, 2019 at 10:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The pinctrl->functions[] array has pinctrl->num_functions elements and
> the pinctrl->groups[] array is the same way.  These are set in
> ns2_pinmux_probe().  So the > comparisons should be >= so that we don't
> read one element beyond the end of the array.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Scott's ACK.

Yours,
Linus Walleij
