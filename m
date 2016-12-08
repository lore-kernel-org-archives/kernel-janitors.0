From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 12:40:29 +0000
Subject: Re: [PATCH 3/5] staging: comedi: usbdux: Move an assignment in usbdux_alloc_usb_buffers()
Message-Id: <20161208124029.GV8176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <92a56e39-6472-415c-0fa6-e2786b006f98@users.sourceforge.net>
In-Reply-To: <92a56e39-6472-415c-0fa6-e2786b006f98@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

This one is pointless.  It's just a style issue that you invented.  Only
Joe Perches is allowed to invent new style guidelines.

regards,
dan carpenter

