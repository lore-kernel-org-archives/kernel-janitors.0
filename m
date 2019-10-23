From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 23 Oct 2019 10:31:08 +0000
Subject: Re: [PATCH] clocksource/drivers: Fix error handling in ttc_setup_clocksource
Message-Id: <9065be0d-c169-ecf7-9ea3-1bcde10fe3ab@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com>
 <20191023044737.2824-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191023044737.2824-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> Fixes: e932900a3279 ("arm: zynq: Use standard timer binding")

I find the commit 70504f311d4bd5b6a6d494f50c5ab0bd30fdf75c
("clocksource/drivers/cadence_ttc: Convert init function to return error" from 2016-06-28)
also interesting (besides the contribution from 2013-04-04) for your software update.

Regards,
Markus
