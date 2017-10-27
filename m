From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 13:12:23 +0000
Subject: Re: iio/light/gp2ap020a00f: Use common error handling code in gp2ap020a00f_adjust_lux_mode()
Message-Id: <ffaa6d77-4bcc-10f4-6c1d-6c53fee158ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <06da0424-1ec9-209e-a433-48288c49132b@users.sourceforge.net>
 <20171026173113.371995f3@archlinux>
In-Reply-To: <20171026173113.371995f3@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: Hartmut Knaack <knaack.h@gmx.de>, Jacek Anaszewski <j.anaszewski@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Same issue - readability is worse

An alternative opinion triggered the development also of this update suggestion.


> than without the patch so it is always going to be rejected.

Corresponding clarification might be needed if the change (in a direction
I propose here) will become desirable.
Can it make sense to concentrate a bit of error reporting at the end
of such a function?

Regards,
Markus
