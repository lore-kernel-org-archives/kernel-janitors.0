From: Dan Carpenter <error27@gmail.com>
Date: Mon, 09 Aug 2010 18:42:54 +0000
Subject: Re: [patch 2/2] qlcnic: using too much stack
Message-Id: <20100809184254.GJ9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100809103727.GH9031@bicker> <0081C370-65E2-434F-BBC6-C688F6F39750@qlogic.com>
In-Reply-To: <0081C370-65E2-434F-BBC6-C688F6F39750@qlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Cc: Amit Salecha <amit.salecha@qlogic.com>, Linux Driver <Linux-Driver@qlogic.com>, "David S. Miller" <davem@davemloft.net>, Sucheta Chakraborty <sucheta.chakraborty@qlogic.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Aug 09, 2010 at 09:46:32AM -0700, Anirban Chakraborty wrote:
> 
> It looks fine except that I'd use kzalloc instead of kcalloc above.
> 

It's no problem to do that, and I'm already respinning the patches but 
I'm confused.  It looks like pci_info gets initialized correctly.  What
am I missing?

regards,
dan carpenter

> thanks,
> -Anirban
