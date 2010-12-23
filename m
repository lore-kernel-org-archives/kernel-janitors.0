From: David Miller <davem@davemloft.net>
Date: Thu, 23 Dec 2010 18:22:16 +0000
Subject: Re: [patch] USB: mcs7830: return negative if auto negotiate fails
Message-Id: <20101223.102216.260073588.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101217132542.GL1639@bicker>
In-Reply-To: <20101217132542.GL1639@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: gregkh@suse.de, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 17 Dec 2010 16:25:43 +0300

> The original code returns 0 on success and 1 on failure.  In fact, at
> this point, "ret" is already either zero or a negative error code so
> we can just return it directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Indeed, the USBNET ->bind() method, which this return value propagates
to, expects negative return values on error.

Applied, and queued up for -stable, thanks Dan.
