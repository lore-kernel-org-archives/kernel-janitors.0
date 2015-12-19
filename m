From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 20:27:06 +0000
Subject: Re: [PATCH] USB-FHCI: Use a signed return type for fhci_create_ep()
Message-Id: <20151219202706.GT5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675BAE0.2010304@users.sourceforge.net>
In-Reply-To: <5675BAE0.2010304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Just make it an int.  The caller also casts it to u32...

regards,
dan carpenter

