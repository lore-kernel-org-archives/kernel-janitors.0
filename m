From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 30 Jul 2012 14:48:27 +0000
Subject: Re: [PATCH 1/9] drivers/usb/host/ehci-atmel.c: use devm_ functions
Message-Id: <Pine.LNX.4.44L0.1207301047260.1386-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1343591173-2819-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1343591173-2819-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343591173-2819-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Jul 2012, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The various devm_ functions allocate memory that is released when a driver
> detaches.  This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Not compiled.

I have no objections to the patches in this series, but I haven't 
checked them in detail and I can't compile them either.

Alan Stern

