From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2013 18:15:50 +0000
Subject: Re: [patch] dmaengine: ste_dma40: off by one in d40_of_probe()
Message-Id: <CACRpkdbQs83Jm3t1N0+RwRATcipRAWsAWRCPwAcm6kO-oaVZUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823092343.GF31293@elgon.mountain>
In-Reply-To: <20130823092343.GF31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Aug 23, 2013 at 11:23 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> If "num_disabled" is equal to STEDMA40_MAX_PHYS (32) then we would write
> one space beyond the end of the pdata->disable_channels[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
