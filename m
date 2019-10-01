From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 01 Oct 2019 09:11:34 +0000
Subject: Re: [PATCH v2] spi: gpio: prevent memory leak in spi_gpio_probe
Message-Id: <6b55e753-5797-2bdc-fae6-f575a0ef8186@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190930205241.5483-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930205241.5483-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> … In order to avoid leak spi_contriller_put must
> be called in case of failure for devm_add_action_or_reset.

How does this wording fit to the diff display that you would like
to add the function call “spi_master_put(master)” in
one if branch?


> Fixes: 8b797490b4db ("spi: gpio: Make sure spi_master_put() is called in every error path")

Is there a need to complete the corresponding exception handling
at any more source code places?

Regards,
Markus
