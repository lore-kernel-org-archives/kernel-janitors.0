From: Stephen Warren <swarren@wwwdotorg.org>
Date: Mon, 30 Jul 2012 16:54:12 +0000
Subject: Re: [PATCH 5/7] drivers/usb/host/ehci-tegra.c: use devm_ functions
Message-Id: <5016BC34.8070306@wwwdotorg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343659425-24563-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343659425-24563-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Alan Stern <stern@rowland.harvard.edu>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/30/2012 08:43 AM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> The various devm_ functions allocate memory that is released when a driver
> detaches.  This patch uses these functions for data that is allocated in
> the probe function of a platform device and is only freed in the remove
> function.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Tested-by: Stephen Warren <swarren@wwwdotorg.org>
