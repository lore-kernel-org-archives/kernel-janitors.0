From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 20:55:02 +0000
Subject: Re: [PATCH] USB-FHCI: Use a signed return type for fhci_create_ep()
Message-Id: <5675C426.7040602@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675BAE0.2010304@users.sourceforge.net>
 <20151219202706.GT5284@mwanda>
In-Reply-To: <20151219202706.GT5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Just make it an int.

Thanks for your suggestion.

Will any more software developers prefer this data type
at some source code places?


> The caller also casts it to u32...

Do you want to get rid of similar casts in affected functions?

Regards,
Markus
