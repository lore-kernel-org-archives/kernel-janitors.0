From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 10 Jun 2012 20:58:04 +0000
Subject: Re: [patch RFC] [media] staging: solo6x10: fix | vs &
Message-Id: <20120610205804.GG13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120609074732.GA30709@elgon.mountain>
In-Reply-To: <20120609074732.GA30709@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Collins <bcollins@bluecherry.net>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On Sat, Jun 09, 2012 at 10:47:32AM +0300, Dan Carpenter wrote:
> The test here is never true because '&' was used instead of '|'.  It was
> the same as:
> 
> 	if (status & ((1<<16) & (1<<17)) ...
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have this hardware and this one really should be tested or
> checked by someone who knows the spec.  It could be that the intent was
> to do:
> 
> 	if ((status & SOLO_IIC_STATE_TRNS) &&
> 	    (status & SOLO_IIC_STATE_SIG_ERR) || ...
> 

It should be this, yes?  For other similar mistakes it was meant to
be this way.

regards,
dan carpenter

