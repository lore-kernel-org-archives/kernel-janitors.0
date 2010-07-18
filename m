From: David Miller <davem@davemloft.net>
Date: Sun, 18 Jul 2010 22:07:40 +0000
Subject: Re: [patch] arcnet: fix signed bug in probe function
Message-Id: <20100718.150740.26966207.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100717172127.GI17585@bicker>
In-Reply-To: <20100717172127.GI17585@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 17 Jul 2010 19:21:28 +0200

> probe_irq_off() returns the first irq found or if two irqs are found
> then it returns the negative of the first irq found.  We can cast
> dev->irq to an int so that the test for negative values works.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
