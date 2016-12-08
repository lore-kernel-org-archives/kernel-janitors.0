From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 15:43:13 +0000
Subject: Re: staging: comedi: usbdux: Split a condition check in usbdux_alloc_usb_buffers()
Message-Id: <0063f739-69e0-2cce-be06-ff3685609d93@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <50c7beca-40ba-6d58-5e2d-568844382bfe@users.sourceforge.net>
 <c2ec3655-60c2-8fa6-f3f2-34842259ef2a@mev.co.uk>
In-Reply-To: <c2ec3655-60c2-8fa6-f3f2-34842259ef2a@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Ian Abbott <abbotti@mev.co.uk>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Actually, the original code worked fine,

I got my doubts when some memory allocations are attempted without checking
the desired success immediately.


> and these changes will result in an Oops if the allocations fail.  I'll e=
xplain why,
> since it isn't obvious without some knowledge of the clean-up strategy us=
ed by comedi drivers:

Thanks for your explanation.


> =E2=80=A6, and all the other comedi drivers follow the same strategy of l=
eaving clean-up
> to their comedi 'detach' handler.

Are there other source code parts worth for further considerations?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
