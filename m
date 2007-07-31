From: Christoph Lameter <clameter@sgi.com>
Date: Tue, 31 Jul 2007 23:46:06 +0000
Subject: Re: [PATCH 25] drivers/usb/misc/ftdi-elan.c: kmalloc + memset
Message-Id: <Pine.LNX.4.64.0707311645340.31337@schroedinger.engr.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
 <200707311942.10127.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311942.10127.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, tony.olech@elandigitalsystems.com, linux-usb-devel@lists.sourceforge.net

On Tue, 31 Jul 2007, Mariusz Kozlowski wrote:

> @@ -2777,12 +2777,14 @@ static int ftdi_elan_probe(struct usb_in
>          size_t buffer_size;
>          int i;
>          int retval = -ENOMEM;
> -        struct usb_ftdi *ftdi = kmalloc(sizeof(struct usb_ftdi), GFP_KERNEL);
> -        if (ftdi = NULL) {
> +        struct usb_ftdi *ftdi;
> +
> +	ftdi = kzalloc(sizeof(struct usb_ftdi), GFP_KERNEL);
> +	if (!ftdi) {

Whitespace damage soewhere?

