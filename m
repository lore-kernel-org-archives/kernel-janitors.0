From: Pete Zaitcev <zaitcev@redhat.com>
Date: Wed, 16 Jul 2008 16:44:51 +0000
Subject: Re: [PATCH] drivers/usb/class/usblp.c: adjust error handling code
Message-Id: <20080716104451.a4c6d06c.zaitcev@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807161717220.28783@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807161717220.28783@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 16 Jul 2008 17:17:42 +0200 (CEST), Julia Lawall <julia@diku.dk> wrote:

> In this code, it is possible to tell statically whether usblp will
> be NULL in the error handling code.

I think it's fine. Not much benefit IMHO.

-- Pete
