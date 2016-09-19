From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 19 Sep 2016 08:36:42 +0000
Subject: Re: [PATCH] NFC: nfcmrvl: constify nfcmrvl_if_ops structures
Message-Id: <20160919083642.GB13777@zurbaran.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470762230-2520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470762230-2520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Julia,

On Tue, Aug 09, 2016 at 07:03:50PM +0200, Julia Lawall wrote:
> The nfcmrvl_if_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/nfc/nfcmrvl/i2c.c     |    2 +-
>  drivers/nfc/nfcmrvl/main.c    |    2 +-
>  drivers/nfc/nfcmrvl/nfcmrvl.h |    4 ++--
>  drivers/nfc/nfcmrvl/spi.c     |    2 +-
>  drivers/nfc/nfcmrvl/uart.c    |    2 +-
>  drivers/nfc/nfcmrvl/usb.c     |    2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
Applied as well, thanks.

Cheers,
Samuel.
