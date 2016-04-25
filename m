From: Johan Hovold <johan@kernel.org>
Date: Mon, 25 Apr 2016 10:38:58 +0000
Subject: Re: [PATCH] USB: ftdi_sio: constify ftdi_sio_quirk structures
Message-Id: <20160425103858.GM18866@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460199748-14466-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460199748-14466-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Johan Hovold <johan@kernel.org>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 09, 2016 at 01:02:28PM +0200, Julia Lawall wrote:
> The ftdi_sio_quirk structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Now applied, thanks.

Johan
