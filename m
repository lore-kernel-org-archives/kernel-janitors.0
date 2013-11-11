From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 11 Nov 2013 07:31:42 +0000
Subject: Re: [patch] Input: tnetv107x-keypad - make irqs signed for error handling
Message-Id: <20131111073142.GB7645@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107075240.GK21844@elgon.mountain>
In-Reply-To: <20131107075240.GK21844@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@dowhile0.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 07, 2013 at 10:52:40AM +0300, Dan Carpenter wrote:
> There is a bug in keypad_probe() where we do:
> 
> 	kp->irq_press   = platform_get_irq_byname(pdev, "press");
> 	kp->irq_release = platform_get_irq_byname(pdev, "release");
> 	if (kp->irq_press < 0 || kp->irq_release < 0) {
> 
> The problem is that these irq variables are unsigned so the error
> handling doesn't work.  I've changed them to signed values.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Applied, thank you.

-- 
Dmitry
