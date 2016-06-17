From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jun 2016 09:59:05 +0000
Subject: Re: [patch] gpiolib: potential oops on failure path
Message-Id: <20160617095740.GB32301@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160617091550.GB25609@mwanda>
 <5763C2C1.8000505@bfs.de>
In-Reply-To: <5763C2C1.8000505@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 17, 2016 at 11:28:33AM +0200, walter harms wrote:
> >  out_free_descs:
> > +	if (i = GPIOHANDLES_MAX)
> > +		i--;
> >  	for (; i >= 0; i--)
> >  		gpiod_free(lh->descs[i]);
> >  	kfree(lh->label);
> 
> 
> Since we have already noticed that programmes are bad at counting backwards
> is it possible to change the loop into counting up ?
> 
> btw: if lh->descs[i] is initialized to NULL it would be more robust just to free everything like:
> 
> for(i=0;i< GPIOHANDLES_MAX; i++)
>   gpiod_free(lh->descs[i]);
>

Depending on the config gpiod_free(NULL) generates a warning.  It's
possible that it will be generated once with the current code actually
but I didn't feel it was worth worrying about that.

Still I wouldn't want to generate 64 warnings.

regards,
dan carpenter

