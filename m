From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 08 Dec 2016 18:12:53 +0000
Subject: Re: staging: comedi: usbduxsigma: Split a condition check in usbduxsigma_alloc_usb_buffers()
Message-Id: <79cd0aa8-f3d8-14c9-07eb-cb5231ebb83f@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <b50256ca-37c4-622a-fe69-d7419bdda0d4@users.sourceforge.net>
 <45ac6168-19a8-0864-3b69-2d2409e2b44f@mev.co.uk>
 <e27eda44-c0fe-8891-8c26-29f7d0f83ce5@users.sourceforge.net>
In-Reply-To: <e27eda44-c0fe-8891-8c26-29f7d0f83ce5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 08/12/16 15:46, SF Markus Elfring wrote:
>>> * Reduce memory allocation sizes for two function calls.
>
> Is this implementation detail worth for further considerations?

I assume you are referring to the allocation of devpriv->ai_urbs and 
devpriv->ao_urbs?  Your patch does not reduce their sizes; `urb` and 
`*devpriv->ai_urbs` have the same type `struct urb *`.  Having said 
that, `sizeof(*devpriv->ai_urbs)` is cleaner code than `sizeof(urb)` in 
this case.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
