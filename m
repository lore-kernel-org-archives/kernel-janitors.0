From: Pawel Moll <pawel.moll@arm.com>
Date: Wed, 19 Apr 2017 13:04:24 +0000
Subject: Re: [PATCH] bus: arm-ccn: Use devm_kcalloc() in arm_ccn_probe()
Message-Id: <1492607064.2768.1.camel@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3458009f-6489-da7f-c1c1-c834d5b9d41d@users.sourceforge.net>
In-Reply-To: <3458009f-6489-da7f-c1c1-c834d5b9d41d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, IngoMolnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 2017-04-19 at 09:29 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 09:12:43 +0200
> 
> Multiplications for the size determination of memory allocations
> indicated that array data structures should be processed.
> Thus use the corresponding function "devm_kcalloc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Fine with me. I'll queue it with a couple other CCN driver changes.
Will probably get into 4.13.

Regards!

Pawel
