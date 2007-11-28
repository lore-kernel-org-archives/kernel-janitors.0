From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 28 Nov 2007 13:18:16 +0000
Subject: Re: [PATCH 4/5] drivers/pnp/resource.c: Add missing pci_dev_put
Message-Id: <20071128131816.49e92fde@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711190905100.19198@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711190905100.19198@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: ambx1@neo.rr.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 19 Nov 2007 09:07:22 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> There should be a pci_dev_put when breaking out of a loop that iterates
> over calls to pci_get_device and similar functions.


Entire series:

Acked-by: Alan Cox <alan@redhat.com>
