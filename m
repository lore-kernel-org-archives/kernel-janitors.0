From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2013 10:40:04 +0000
Subject: Re: [patch] gpio: mvebu: make mvchip->irqbase signed for error handling
Message-Id: <CACRpkdb4jw1GuhHs6OHZ=fNRYTdSZR_E3b=Luh=CkAn7M5+iSg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075019.GH21844@elgon.mountain>
In-Reply-To: <20131107075019.GH21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:50 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a bug in mvebu_gpio_probe() where we do:
>
>         mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
>         if (mvchip->irqbase < 0) {
>
> The problem is that mvchip->irqbase is unsigned so the error handling
> doesn't work.  I have changed it to be a regular int.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fixes.

I'm tagging this for stable as well.

Yours,
Linus Walleij
