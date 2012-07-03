From: Kay Sievers <kay@redhat.com>
Date: Tue, 03 Jul 2012 19:34:21 +0000
Subject: Re: [patch] printk: remove some dead code
Message-Id: <1341344061.1716.3.camel@mop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120703104511.GA29501@elgon.mountain>
In-Reply-To: <20120703104511.GA29501@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-07-03 at 20:43 +0200, walter harms wrote:
> >  		} else {
> >  			len += 3;
> > -			if (msg->level > 9)
> > +			if (prefix > 9)
> >  				len++;
> > -			if (msg->level > 99)
> > +			if (prefix > 99)
> >  				len++;
> >  		}
> >  	}
> > 
> > 
> 
> just for my curiosity: why not len+=5 and forget the rest ?

It's a possibly multi-digit decimal number, and the length should be
actual length not the maximum.

Kay

