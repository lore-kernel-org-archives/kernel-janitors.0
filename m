From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Jun 2013 08:06:14 +0000
Subject: Re: [patch -next] FMC: NULL dereference on allocation failure
Message-Id: <20130620080614.GR5008@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1371658504.2038.25.camel@joe-AO722>
 <20130619160101.GA29108@mwanda>
 <20130619175758.GA23533@mail.gnudd.com>
In-Reply-To: <20130619175758.GA23533@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>
Cc: joe@perches.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 19, 2013 at 07:57:58PM +0200, Alessandro Rubini wrote:
> I'm not a fan of kcalloc. I think it removes readability.

Ok.  We'll go with my original patch then.

regards,
dan carpenter

