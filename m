From: Joe Perches <joe@perches.com>
Date: Thu, 07 Jun 2012 15:05:44 +0000
Subject: Re: [PATCH 3/7] drivers/usb/gadget/pch_udc.c: adjust suspicious bit operation
Message-Id: <1339081544.6009.44.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1339018901-28439-4-git-send-email-Julia.Lawall@lip6.fr>
	 <4FD0A5F9.9050405@mvista.com> <alpine.DEB.2.02.1206071622350.1807@hadrien>
In-Reply-To: <alpine.DEB.2.02.1206071622350.1807@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Sergei Shtylyov <sshtylyov@mvista.com>, Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Thu, 2012-06-07 at 16:23 +0200, Julia Lawall wrote:
> Oops, thanks for noticing that.  I'll send a corrected version.

Hi Julia.

I should have let you know that I already submitted
a patch series for a simple treewide
"s/if (value | UC_CONSTANT)/if (value & UC_CONSTANT)/"
https://lkml.org/lkml/2012/5/30/625

Felipe has already picked this patch up.
https://lkml.org/lkml/2012/6/1/83



