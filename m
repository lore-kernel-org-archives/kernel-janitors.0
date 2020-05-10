From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 10 May 2020 09:55:57 +0000
Subject: Re: [PATCH] iio: sca3000: Remove an erroneous get_device() call in sca3000_read_data()
Message-Id: <20200510105557.716fa742@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6e972e9b-c799-f0ad-91ac-144640b463f6@web.de>
In-Reply-To: <6e972e9b-c799-f0ad-91ac-144640b463f6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Thomas Gleixner <tglx@linutronix.de>

On Wed, 6 May 2020 17:30:06 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> > This looks really unusual to have a 'get_device()' hidden in a 'dev_err()' call.  
> 
> Is there a need to prevent similar function calls by the means of
> advanced source code analysis?

It's a seriously stupid bug so I'd have thought unlikely to
occur often enough to be worth it.

Jonathan

> 
> Regards,
> Markus
