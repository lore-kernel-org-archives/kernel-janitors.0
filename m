From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 15:24:57 +0000
Subject: Re: [PATCH] mtd: onenand: prevent memory leak in onenand_scan
Message-Id: <0b12fc29-d93c-ef02-cc5c-85057bfe6197@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925154302.17708-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190925154302.17708-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, Stephen A McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Navid Emamdoost <emamd001@umn.edu>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

> In onenand_scan if scan_bbt fails the allocated buffers should be released.

Will an other change description be more appropriate?


How do you think about to add the tag “Fixes” here?

Regards,
Markus
