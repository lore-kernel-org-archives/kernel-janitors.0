From: Robin Holt <holt@sgi.com>
Date: Fri, 16 Dec 2011 11:55:00 +0000
Subject: Re: [patch] sgi-xp: nested calls to spin_lock_irqsave()
Message-Id: <20111216115500.GD2547@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215064805.GA2776@elgon.mountain>
In-Reply-To: <20111215064805.GA2776@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 15, 2011 at 09:48:05AM +0300, Dan Carpenter wrote:
> The code here has a nested spin_lock_irqsave().  It's not needed since
> IRQs are already disabled and it causes a problem because it means that
> IRQs won't be enabled again at the end.  The second call to
> spin_lock_irqsave() will overwrite the value of irq_flags and we can't
> restore the proper settings.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Robin Holt <holt@sgi.com>
