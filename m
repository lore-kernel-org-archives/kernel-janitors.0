From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Feb 2020 16:12:49 +0000
Subject: Re: [PATCH] pinctrl: mediatek: Fix some off by one bugs
Message-Id: <CACRpkdZeFrmA=ZwSNxY0=J6BpASkTrZLVQXBoenZKXFRS3xJPA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200218055247.74s2xa7veqx2do34@kili.mountain>
In-Reply-To: <20200218055247.74s2xa7veqx2do34@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Wang <sean.wang@kernel.org>, Light Hsieh <light.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 18, 2020 at 6:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These comparisons should be >= instead of > to prevent accessing one
> element beyond the end of the hw->soc->pins[] array.
>
> Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied as a non-critical fix with Matthias' Review tag.

Yours,
Linus Walleij
