From: David Miller <davem@davemloft.net>
Date: Sun, 07 Mar 2010 23:26:28 +0000
Subject: Re: [patch] irda-usb: add error handling and fix leak
Message-Id: <20100307.152628.35325677.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100307123542.GA6469@bicker>
In-Reply-To: <20100307123542.GA6469@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: samuel@sortiz.org, shemminger@vyatta.com, kaber@trash.net, tabe@mvista.com, julia@diku.dk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sun, 7 Mar 2010 15:35:42 +0300

> If the call to kcalloc() fails then we should return -ENOMEM.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
