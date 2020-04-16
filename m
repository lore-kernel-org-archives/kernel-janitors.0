From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 16 Apr 2020 09:46:45 +0000
Subject: Re: i2c: img-scb: remove duplicate dev_err()
Message-Id: <73cc5a7c-787c-b263-7679-0f1fa58a70f8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08564c03-3bbd-5518-1a9d-a40b8ca09f48@web.de>
 <20200415025426.GB14300@nuc8i5> <b5db65f5-f236-9e22-98df-07629a827738@web.de>
 <20200415152115.GA17519@nuc8i5> <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
In-Reply-To: <668fe4da-56f2-8abe-1113-fa180f307524@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Allison Randal <allison@lohutok.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Shah Nehal-Bakulchandra <Nehal-bakulchandra.Shah@amd.com>, Tang Bin <tangbin@cmss.chinamobile.com>, Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa@the-dreams.de>, Thor Thayer <thor.thayer@linux.intel.com>, Robert Richter <rrichter@marvell.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Barry Song <baohua@kernel.org>, kernel-janitors@vger.kernel.org

>>> Would you like to take another look at corresponding change possibilities?
>>>
>> yes, I want to do it and thanks for your info.

How do you think about to improve the clarification around potentially
“odd fixes” (because of collateral evolution)?


I noticed your update suggestion “i2c: busses: convert to devm_platform_ioremap_resource”.
https://lore.kernel.org/linux-i2c/20200409135224.7426-1-zhengdejin5@gmail.com/
https://lore.kernel.org/patchwork/patch/1222122/
https://lkml.org/lkml/2020/4/9/431

It seems that you got encouraged to contribute changes according to another
transformation approach by a single patch for a directory hierarchy.
How likely is it that such adjustments touch source code places
where related error messages would be found for further software
development considerations?
Would you like to wait until the integration of this update succeeded?

Will it be interesting in the meantime to become more familiar with
applications around scripts for the semantic patch language?
Can the Coccinelle software make the discussed transformations more convenient
also for your needs?

Regards,
Markus
