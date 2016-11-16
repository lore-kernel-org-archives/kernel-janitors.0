From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Nov 2016 19:57:01 +0000
Subject: Re: [patch] pinctrl: single: Fix a couple error codes
Message-Id: <CACRpkdYOKg01t0u39gsJk2FWz411dkoM43yR7UWNkoyUcP9gwA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161116114151.GA31224@mwanda>
In-Reply-To: <20161116114151.GA31224@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Nov 16, 2016 at 12:41 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> We should return -ENOMEM instead of success if pcs_add_function() fails.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Tony's ACK.

Yours,
Linus Walleij
