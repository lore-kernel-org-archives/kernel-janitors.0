From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 17 Apr 2020 20:36:35 +0000
Subject: Re: [PATCH v1] i2c: busses: convert to devm_platform_get_and_ioremap_resource
Message-Id: <a64c4e68-afbd-f7d7-05b7-a62776896ac5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, Thor Thayer <thor.thayer@linux.intel.com>, Patrick Williams <alpawi@amazon.com>, Alain Volmat <alain.volmat@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Pierre-Yves Mordret <pierre-yves.mordret@st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Barry Song <baohua@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, George Cherian <gcherian@marvell.com>

> use devm_platform_get_and_ioremap_resource() to simplify code, which
> contains platform_get_resource() and devm_ioremap_resource(), it also
> get the resource for use by the following code.

I suggest to improve also this change description.

I have tried another script variant out for the semantic patch language.
This source code analysis approach would propose to transform
15 source files (for example in the directory “drivers/i2c”
of the software “Linux next-20200417”).
Would you like to take another look at corresponding change possibilities?

Regards,
Markus
