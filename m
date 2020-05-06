From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 May 2020 15:30:06 +0000
Subject: Re: [PATCH] iio: sca3000: Remove an erroneous get_device() call in sca3000_read_data()
Message-Id: <6e972e9b-c799-f0ad-91ac-144640b463f6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506035206.192173-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200506035206.192173-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Thomas Gleixner <tglx@linutronix.de>

> This looks really unusual to have a 'get_device()' hidden in a 'dev_err()' call.

Is there a need to prevent similar function calls by the means of
advanced source code analysis?

Regards,
Markus
