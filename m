From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 10:03:04 +0000
Subject: Re: [PATCH 3/4] gpio-stmpe: Move an assignment in stmpe_gpio_probe()
Message-Id: <CACRpkdYEKtnxun+ev-oscbDW4+Gjj=0pFdeW=1LznYZaH9vyPw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <25ddf208-1f02-8bb7-b6b8-e0ffa422b754@users.sourceforge.net>
In-Reply-To: <25ddf208-1f02-8bb7-b6b8-e0ffa422b754@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:03 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 20:44:15 +0100
>
> Move the assignment for the local variable "irq" so that its setting
> will only be performed directly before it is checked by this function.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
