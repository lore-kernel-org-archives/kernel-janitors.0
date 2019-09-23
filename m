From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 23 Sep 2019 09:25:46 +0000
Subject: Re: EDAC: Armada XP: Use devm_platform_ioremap_resource() in two functions
Message-Id: <65836b6f-9133-4a14-466d-865830f5bfc0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3cf2076e-6394-4997-613d-cbf5b6dbee1e@web.de>
 <20190923081117.4p4mwqz35fzavkeg@rric.localdomain>
In-Reply-To: <20190923081117.4p4mwqz35fzavkeg@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Robert Richter <rrichter@marvell.com>, linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Which semantic patch did you use here?

I suggest to take another look at details around background information
on a subject like “Coccinelle: api: add devm_platform_ioremap_resource script”.
https://lore.kernel.org/r/2cacd712-a8b8-6471-a9b4-23ba54434c02@web.de/
https://systeme.lip6.fr/pipermail/cocci/2019-September/006303.html
https://lkml.org/lkml/2019/9/19/81


> There are probably more drivers to fix than the above and the one you fixed:

Yes, of course.

I concentrated my update suggestions on a specific source code
transformation variant recently.


> So while at it, how about fixing the .cocci patch in scripts/ and run
> it for drivers/edac?

Some developers are trying to improve affected software components further.
Did you eventually receive similar patches already by other contributors?


> There should be one patch only for all edac drivers.

Is there consensus for this kind of change expectation?

Regards,
Markus
