From: Johan Hovold <johan@kernel.org>
Date: Mon, 31 Jul 2017 07:14:14 +0000
Subject: Re: [PATCH 10/11] greybus: usb: constify hc_driver structures
Message-Id: <20170731071414.GA6339@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501274518-25170-11-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-11-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Johan Hovold <johan@kernel.org>, kernel-janitors@vger.kernel.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, Jul 28, 2017 at 10:41:57PM +0200, Julia Lawall wrote:
> The hc_driver structure is only passed as the first argument to
> usb_create_hcd, which is declared as const.  Thus the hc_driver structure
> itself can be const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Johan Hovold <johan@kernel.org>

Thanks,
Johan
