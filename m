From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 16 Nov 2015 18:32:21 +0000
Subject: Re: [PATCH] USB-EHCI: Delete unnecessary checks before the function call "dma_pool_destroy"
Message-Id: <Pine.LNX.4.44L0.1511161331560.1938-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <564A1B00.8030507@users.sourceforge.net>
References: <564A1B00.8030507@users.sourceforge.net>
In-Reply-To: <564A1B00.8030507@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 16 Nov 2015, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 16 Nov 2015 19:01:44 +0100
> 
> The dma_pool_destroy() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

