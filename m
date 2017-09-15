From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 18:54:44 +0000
Subject: Re: [media] stm32-dcmi: Improve four size determinations
Message-Id: <fdcd16a7-0345-9a6c-1ef8-85ac32eb9448@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <730b535e-39a5-2c2b-f463-e76da967a723@users.sourceforge.net>
 <f4e400ea-9660-05cd-3194-cdf2495a2376@users.sourceforge.net>
 <1505499388.27581.13.camel@perches.com>
In-Reply-To: <1505499388.27581.13.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

>> +	memcpy(dcmi->sd_formats, sd_fmts, num_fmts * sizeof(*dcmi->sd_formats));
> 
> devm_kmemdup

Are function variants provided which handle memory duplications
for arrays explicitly?

Regards,
Markus
