From: David Miller <davem@davemloft.net>
Date: Fri, 27 Jul 2012 20:46:32 +0000
Subject: Re: [patch] USB: kaweth.c: use GFP_ATOMIC under spin_lock
Message-Id: <20120727.134632.76746326614521026.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120727114651.GA15492@elgon.mountain>
In-Reply-To: <20120727114651.GA15492@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Jul 2012 14:46:51 +0300

> The problem is that we call this with a spin lock held.  The call tree
> is:
> 	kaweth_start_xmit() holds kaweth->device_lock.
> 	-> kaweth_async_set_rx_mode()
> 	   -> kaweth_control()
> 	      -> kaweth_internal_control_msg()
> 
> The kaweth_internal_control_msg() function is only called from
> kaweth_control() which used GFP_ATOMIC for its allocations.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
