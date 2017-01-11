From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jan 2017 13:41:02 +0000
Subject: Re: [patch] pinctrl/amd: white space cleanups in amd_gpio_dbg_show()
Message-Id: <CACRpkdYWm6Y5B3e_GKSCZkoXQG0XaQr7cZgwJTGHe=9K__rSxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170107063214.GE26959@elgon.mountain>
In-Reply-To: <20170107063214.GE26959@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shah@elgon.mountain, Nehal-bakulchandra <Nehal-Bakulchandra.shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 7, 2017 at 7:32 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We accidentally deleted two tabs from the first line, but even with that
> fixed the conditions were not really kernel style.  Put the && at the
> end of the line so we can align the condition clauses.  Also add spaces
> around the "+" operator.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
