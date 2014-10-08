From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Oct 2014 10:18:19 +0000
Subject: Re: [patch 1/2 -next] cxgb4: clean up a type issue
Message-Id: <20141008101819.GB26918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141002112219.GA25606@mwanda>
 <20141003.154629.555967384624529643.davem@davemloft.net>
In-Reply-To: <20141003.154629.555967384624529643.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 03, 2014 at 03:46:29PM -0700, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Thu, 2 Oct 2014 14:22:19 +0300
> 
> > The tx_desc struct hold 8 __be64 values.  The original code took a
> > tx_desc pointer then casted it to an int pointer and then casted it to a
> > u64 pointer.  It was confusing and triggered some static checker
> > warnings.
> > 
> > I have changed the cxgb_pio_copy() to only take tx_desc pointers.  This
> > isn't really a loss of flexibility because anything else was buggy to
> > begin with.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Please address the feedback you've received, resubmit this series, and actually
> number this second change "2/2" instead of "1/2" :-)
> 

Yes.  Sorry for the delay.  I'll send that this afternoon.

regards,
dan carpenter
