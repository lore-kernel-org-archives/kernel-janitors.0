From: Joe Perches <joe@perches.com>
Date: Thu, 16 Apr 2020 19:34:10 +0000
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
Message-Id: <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
         <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
In-Reply-To: <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, Thor Thayer <thor.thayer@linux.intel.com>, Tang Bin <tangbin@cmss.chinamobile.com>, Stephen Boyd <swboyd@chromium.org>, Patrick Williams <alpawi@amazon.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Barry Song <baohua@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, George Cherian <gcherian@marvell.com>, Hans de Goede <hdegoede@redhat.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>

On Thu, 2020-04-16 at 20:22 +0200, Markus Elfring wrote:
> > it will print an error message by itself when platform_get_irq()
> > goes wrong. so don't need dev_err() in here again.
> 
> I suggest to improve the commit message considerably.

I suggest you ignore Markus' suggestion.

The commit message is OK.

The subject _could_ have included "platform_get_irq" something like

Subject: [PATCH v2] i2c: busses: Remove platform_get_irq()'s duplicated dev_err()

but I believe it's not important enough to redo.
