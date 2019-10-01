From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 01 Oct 2019 02:51:24 +0000
Subject: Re: [PATCH] phy-brcm-usb: Use devm_platform_ioremap_resource() in brcm_usb_phy_probe()
Message-Id: <5f3ec750-d295-bf57-39b6-b05ed6f05da1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88679e6a-6701-7d30-d52e-5e970af4de04@web.de>
In-Reply-To: <88679e6a-6701-7d30-d52e-5e970af4de04@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, bcm-kernel-feedback-list@broadcom.com, Al Cooper <alcooperx@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 9/26/2019 9:08 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 26 Sep 2019 18:00:14 +0200
> 
> Simplify this function implementation a bit by using
> a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
