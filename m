From: Tony Lindgren <tony@atomide.com>
Date: Thu, 14 Nov 2019 17:07:31 +0000
Subject: Re: [PATCH] bus: ti-sysc: Adjust exception handling in sysc_child_add_named_clock()
Message-Id: <20191114170731.GU5610@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
In-Reply-To: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

* Markus Elfring <Markus.Elfring@web.de> [191106 10:22]:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 6 Nov 2019 19:12:30 +0100
> 
> Add a jump target so that a call of the function “clk_put”
> can be better reused at the end of this function.

Thanks applying into omap-for-v5.5/ti-sysc.

Regards,

Tony
