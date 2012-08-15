From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 15 Aug 2012 09:20:34 +0000
Subject: Re: [PATCH] drivers/iio/adc/at91_adc.c: use devm_ functions
Message-Id: <alpine.DEB.2.02.1208151119290.2000@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343729383-30073-1-git-send-email-Julia.Lawall@lip6.fr> <5017D148.6030006@metafoo.de> <alpine.DEB.2.02.1207311509040.1894@hadrien> <502AB5F1.3050908@kernel.org> <502B658F.5040100@metafoo.de>
In-Reply-To: <502B658F.5040100@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Jonathan Cameron <jic23@cam.ac.uk>, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

> devm_request_and_ioremap will already print a error messages on it's own if
> something goes wrong. So strictly speaking this one is redundant, but I don't
> think it is necessary to do a resend just for this, maybe you can remove the
> extra dev_err when you apply the patch.

Thanks for pointing that out.  I will get rid of the messages in the 
future.  That seems easier than figuring out how to adapt the message to 
the new function.

julia
