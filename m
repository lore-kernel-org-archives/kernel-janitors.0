From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 23 Oct 2019 08:20:12 +0000
Subject: Re: [PATCH] clocksource/drivers: Fix error handling in ttc_setup_clocksource
Message-Id: <5913e1b8-b292-de06-e47f-d5f982db2b10@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com>
 <20191023044737.2824-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191023044737.2824-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thomas Gleixner <tglx@linutronix.de>

> Fixes: e932900a3279 ("arm: zynq: Use standard timer binding")

How do you think about to add the tag “Reported-by” for Michal Simek?
https://lore.kernel.org/linux-arm-kernel/2a6cdb63-397b-280a-7379-740e8f43ddf6@xilinx.com/
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=3b7c59a1950c75f2c0152e5a9cd77675b09233d6#n584

Regards,
Markus
