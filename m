From: Johan Hovold <johan@kernel.org>
Date: Wed, 04 Jul 2018 13:43:14 +0000
Subject: Re: [PATCH] USB: serial: ch341: type promotion bug in ch341_control_in()
Message-Id: <20180704134314.GS9802@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704092938.g3woukcm5ir6zr7e@kili.mountain>
In-Reply-To: <20180704092938.g3woukcm5ir6zr7e@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:29:38PM +0300, Dan Carpenter wrote:
> The "r" variable is an int and "bufsize" is an unsigned int so the
> comparison is type promoted to unsigned.  If usb_control_msg() returns a
> negative that is treated as a high positive value and the error handling
> doesn't work.
> 
> Fixes: 2d5a9c72d0c4 ("USB: serial: ch341: fix control-message error handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching this.

Now applied with a stable tag as this could have security implications.

Johan
