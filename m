From: David Miller <davem@davemloft.net>
Date: Tue, 27 Jul 2010 04:05:22 +0000
Subject: Re: [PATCH] usbnet: use jiffies in schedule_timeout(), not msecs
Message-Id: <20100726.210522.191412048.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280132742-8126-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280132742-8126-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, gregkh@suse.de, ben@decadent.org.uk, joe@perches.com, shemminger@vyatta.com, jussi.kivilinna@mbnet.fi, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 26 Jul 2010 12:25:42 +0400

> usbnet_terminate_urbs() uses schedule_timeout() with argument 3 msecs.
> schedule_timeout() uses jiffies as argument, so convert msecs to jiffies
> with msecs_to_jiffies().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied, thanks.
