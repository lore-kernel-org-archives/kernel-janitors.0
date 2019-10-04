From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2019 21:08:02 +0000
Subject: Re: [PATCH v2] ethernet: gemini: Use devm_platform_ioremap_resource() in gemini_ethernet_probe()
Message-Id: <CACRpkdZPnRJWojgRsZvSTDWuxbOtQws5uQXDSPBBem6HE8iJgA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <af65355e-c2f8-9142-4d0b-6903f23a98b2@web.de>
 <CH2PR02MB700047AFFFE08FE5FD563541C78E0@CH2PR02MB7000.namprd02.prod.outlook.com>
 <bd860b05-f493-20e6-083d-66ef3cb61f60@web.de>
In-Reply-To: <bd860b05-f493-20e6-083d-66ef3cb61f60@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Radhey Shyam Pandey <radheys@xilinx.com>, netdev <netdev@vger.kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Fri, Sep 20, 2019 at 11:23 AM Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 10:52:56 +0200
>
> Simplify this function implementation by using the wrapper function
> “devm_platform_ioremap_resource” instead of calling the functions
> “platform_get_resource” and “devm_ioremap_resource” directly.
>
> * Thus reduce also a bit of exception handling code here.
> * Delete the local variable “res”.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Seems correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BR
Linus Walleij
