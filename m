From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jun 2012 11:01:05 +0000
Subject: Re: [patch] staging: comedi: cleanup comedi_recognize()
Message-Id: <20120605110105.GG4400@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120524102851.GA4399@elgon.mountain>
In-Reply-To: <20120524102851.GA4399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 05, 2012 at 12:06:10PM +0200, walter harms wrote:
> Hi all,
> the patch is fine with me but i have a few basic questions:
> 
> Why the (void  *) at all ? it returns a name what is a const char *.
> 

We're really returning a pointer to a private struct, it's just that
the first element on the struct always has to be a pointer to char *.

> A look at the structure also shows that this is a linked list, why
> using offset instead of driv->next ?
> 

It's a different list.

regards,
dan carpenter

