From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 20 Sep 2019 17:51:20 +0000
Subject: Re: [PATCH] serial: bcm2835: Use devm_platform_ioremap_resource() in bcm2835aux_serial_probe()
Message-Id: <b874901f-8dc2-e0ec-b2da-26b37e75ec26@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fcb34c72-89c7-9993-fc0a-ba3a61708bec@web.de>
In-Reply-To: <fcb34c72-89c7-9993-fc0a-ba3a61708bec@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-serial@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Martin Sperl <kernel@martin.sperl.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <swboyd@chromium.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

On 9/18/19 1:12 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 22:00:14 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
