From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 16 Apr 2020 18:22:33 +0000
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
Message-Id: <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
In-Reply-To: <20200416152345.23077-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, Thor Thayer <thor.thayer@linux.intel.com>, Tang Bin <tangbin@cmss.chinamobile.com>, Stephen Boyd <swboyd@chromium.org>, Patrick Williams <alpawi@amazon.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Barry Song <baohua@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, George Cherian <gcherian@marvell.com>, Hans de Goede <hdegoede@redhat.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>

> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.

I suggest to improve the commit message considerably.

Would you like to integrate any information from a response
on the topic “drm/meson: Delete an error message in meson_dw_hdmi_bind()” by
a contributor like Neil Armstrong?
https://lore.kernel.org/dri-devel/54e0b6e4-4a39-c567-7355-2b2330a95294@baylibre.com/
https://lore.kernel.org/patchwork/comment/1418937/
https://lkml.org/lkml/2020/4/15/186


> v1 -> v2:

Will a version identification be sufficient without the arrow?


> 	- add 19 similar changes by Markus's suggestion.

* With which search tool did you find the presented update candidates?

* Will a link to the commit “driver core: platform: Add an error message
  to platform_get_irq*()” (by Stephen Boyd from 2019-07-29) become helpful
  as background information for such collateral evolution?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/platform.c?id=7723f4c5ecdb8d832f049f8483beb0d1081cedf6

Regards,
Markus
