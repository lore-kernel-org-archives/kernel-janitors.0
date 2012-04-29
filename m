From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 29 Apr 2012 13:46:51 +0000
Subject: Re: [patch] [media] ngene: remove an unneeded condition
Message-Id: <20120429134651.GC13883@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420131502.GB26339@elgon.mountain>
In-Reply-To: <20120420131502.GB26339@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Apr 28, 2012 at 06:23:58PM +0200, walter harms wrote:
> i agree but in this special case it looks strange. Would that more
> readable ?
> 
> if (stat < 0)
> {
> <errorhandling here>	
>  return stat;	
> }
> 	
> return 0:
> 

No.  Gotos are perfectly fine for unwinding in the error handling
code.  In this case there are several in a row.  Copy and pasting
the error handling leads to forgot to add a kfree() bugs.

It doesn't look weird at all, it looks like the most normal kind of
error handling there is in the kernel.

regards,
dan carpenter
