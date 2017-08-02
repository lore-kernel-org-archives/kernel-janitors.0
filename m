From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Aug 2017 11:56:22 +0000
Subject: Re: [PATCH] staging: pi433: remove some macros, introduce some inline functions
Message-Id: <20170802115622.56ayoh6ogrv347d6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ee876334d7eb4af0d2277d0b9a61fdb6-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAlZWHQDVFE=-webmailer1@server03.webmailer.webmailer.hosteurope.de>
 <20170802115330.uvvzqrimbz2ixoyk@mwanda>
In-Reply-To: <20170802115330.uvvzqrimbz2ixoyk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolf Entwicklungen <Marcus.Wolf@Wolf-Entwicklungen.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 02, 2017 at 02:53:30PM +0300, Dan Carpenter wrote:
> > +{
> > +	u8 tempVal;
> 

Btw, just call this "u8 tmp;".  The word "temp" is short for temperature
and "val" doesn't add any information because it's clearly a value.

regards,
dan carpenter
