From: David Miller <davem@davemloft.net>
Date: Sat, 01 Jun 2013 00:11:14 +0000
Subject: Re: [patch -next] bnx2x: fix a power state test
Message-Id: <20130531.171114.1448993396211120979.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130531075840.GA28370@debian>
In-Reply-To: <20130531075840.GA28370@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 13:07:19 +0300

> PCI_D0 is zero so the original test is never true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have the hardware to test this, and I'm not positive on it.
> Buyer beware!

Someone please review/test this patch, thanks.
