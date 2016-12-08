From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 12:22:06 +0000
Subject: Re: [PATCH 1/5] staging: comedi: serial2002: Combine four kcalloc() calls into one in serial2002_set
Message-Id: <20161208122206.GS8176@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <011f1cb9-481c-9d9c-bcf5-8373f1796a0a@users.sourceforge.net>
In-Reply-To: <011f1cb9-481c-9d9c-bcf5-8373f1796a0a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

The original code was simpler.

regards,
dan carpenter

