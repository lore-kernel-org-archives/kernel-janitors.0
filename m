From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 15:46:02 +0000
Subject: Re: staging: comedi: usbduxsigma: Split a condition check in usbduxsigma_alloc_usb_buffers()
Message-Id: <e27eda44-c0fe-8891-8c26-29f7d0f83ce5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <b50256ca-37c4-622a-fe69-d7419bdda0d4@users.sourceforge.net>
 <45ac6168-19a8-0864-3b69-2d2409e2b44f@mev.co.uk>
In-Reply-To: <45ac6168-19a8-0864-3b69-2d2409e2b44f@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Reduce memory allocation sizes for two function calls.

Is this implementation detail worth for further considerations?

Regards,
Markus
