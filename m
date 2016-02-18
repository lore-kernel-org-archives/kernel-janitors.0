From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Feb 2016 23:27:54 +0000
Subject: Re: [patch] pinctrl: mediatek: signedness bug in mtk_pmx_gpio_request_enable()
Message-Id: <CACRpkdYtESieSy0mwp+2f98sxoJygW+Mm+XxCA0Df_UR6qbcug@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160216200658.GA9223@mwanda>
In-Reply-To: <20160216200658.GA9223@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Biao Huang <biao.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Jonas Gorski <jogo@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, kernel-janitors@vger.kernel.org

On Tue, Feb 16, 2016 at 9:06 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "muxval" stores a value from 0-255 or a negative error code.  It has to
> be signed for the error handling to work.
>
> Fixes: 59ee9c96dd5d ('pinctrl: mediatek: Add gpio_request_enable support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I already applied something like this.

Yours,
Linus Walleij
