From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Thu, 14 Nov 2013 09:05:45 +0000
Subject: Re: [patch] usb: gadget: update some out of date comments
Message-Id: <52849269.4030509@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131114084211.GA30780@elgon.mountain>
In-Reply-To: <20131114084211.GA30780@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/14/2013 09:42 AM, Dan Carpenter wrote:
> These functions used to return negative errror codes but now they return
> ERR_PTRs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
