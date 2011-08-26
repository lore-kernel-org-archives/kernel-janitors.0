From: David Miller <davem@davemloft.net>
Date: Fri, 26 Aug 2011 16:51:45 +0000
Subject: Re: [patch -next] bna: unlock on error path in pnad_pci_probe()
Message-Id: <20110826.125145.246690891101270580.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110824112922.GC5975@shale.localdomain>
In-Reply-To: <20110824112922.GC5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: rmody@brocade.com, ddutt@brocade.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 14:29:22 +0300

> We introduced a new lock here, so there was error path which needs
> an unlock now.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
