From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Apr 2016 10:36:07 +0000
Subject: Re: [patch] [media] tw686x: off by one bugs in tw686x_fields_map()
Message-Id: <20160427103607.GJ17913@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160427080928.GC22469@mwanda>
 <20160427073159.041490f8@recife.lan>
In-Reply-To: <20160427073159.041490f8@recife.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 27, 2016 at 07:31:59AM -0300, Mauro Carvalho Chehab wrote:
> I don't like magic numbers, but, in this very specific case, setting
> frames per second (fps) var to 25 or 30 makes much more sense.

Fine fine.  I buy that rationale.

regards,
dan carpenter

