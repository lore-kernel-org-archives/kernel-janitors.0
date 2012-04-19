From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Thu, 19 Apr 2012 21:03:17 +0000
Subject: Re: [patch] USB: bcma: suspend() only takes one argument now
Message-Id: <4F907D95.4020909@hauke-m.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120419104608.GA30011@elgon.mountain>
In-Reply-To: <20120419104608.GA30011@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On 04/19/2012 12:46 PM, Dan Carpenter wrote:
> We changed the API here a couple months ago.  It suspend() only takes
> one argument now.  GCC complains about this:
> 
>     drivers/usb/host/bcma-hcd.c:320:2: warning: initialization from
>         incompatible pointer type [enabled by default]
>     drivers/usb/host/bcma-hcd.c:320:2: warning: (near initialization
>         for ‘bcma_hcd_driver.suspend’) [enabled by default]
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

Thanks for the patch.

Hauke
