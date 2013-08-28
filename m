From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Aug 2013 12:45:04 +0000
Subject: Re: [patch] pinctrl: s3c24xx: off by one in s3c24xx_eint_init()
Message-Id: <CACRpkdYtZndvqZgsuqLAieut3aMfF1hfwiWaWWjZccctfj66uA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130826233217.GA17061@elgon.mountain>
In-Reply-To: <20130826233217.GA17061@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Tue, Aug 27, 2013 at 3:11 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If "irq = NUM_EINT" then it writes one space beyond the end of the
> eint_data->domains[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Heiko's ACK.

Yours,
Linus Walleij
