From: Oliver Neukum <oliver@neukum.org>
Date: Wed, 16 Jul 2008 15:44:58 +0000
Subject: Re: [PATCH] drivers/usb/class/usblp.c: adjust error handling code
Message-Id: <200807161744.59137.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807161717220.28783@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807161717220.28783@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: zaitcev@redhat.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Mittwoch 16 Juli 2008 17:17:42 schrieb Julia Lawall:
> From: Julia Lawall <julia@diku.dk>
> 
> In this code, it is possible to tell statically whether usblp will be NULL
> in the error handling code.
> 
> Another option would have been to put a label directly on the return.

That would be better. It means less chance to overlook an error case
if locking needs to be added in the future.

	Regards
		Oliver

