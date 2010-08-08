From: "Eilon Greenstein" <eilong@broadcom.com>
Date: Sun, 08 Aug 2010 19:14:53 +0000
Subject: Re: [PATCH 32/42] drivers/net/bnx2x: Adjust confusing if
Message-Id: <1281294893.21680.5.camel@lb-tlvb-eilong.il.broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052226210.31692@ask.diku.dk>
 <20100806070749.GP9031@bicker>
In-Reply-To: <20100806070749.GP9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, yanivr@broadcom.com

On Fri, 2010-08-06 at 00:07 -0700, Dan Carpenter wrote:
> On Thu, Aug 05, 2010 at 10:26:38PM +0200, Julia Lawall wrote:
> > ---
> > This patch doesn't change the semantics of the code.  But it might not be
> > what is intended.
> > 
> 
> I think there may have been some if statements which were removed before
> the code was merged into the kernel?  Here is another one from that same
> function.  Someone can roll this in with your patch.
> 

Thanks Dan. We will send a more complete patch series for this file once
net-next is open again.


