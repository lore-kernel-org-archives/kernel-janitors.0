From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Aug 2014 11:21:04 +0000
Subject: Re: [patch] VMCI: integer overflow in vmci_datagram_dispatch()
Message-Id: <20140829112104.GF5071@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140829084256.GA14780@mwanda>
 <5400606B.8010905@bfs.de>
In-Reply-To: <5400606B.8010905@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: linux-kernel@vger.kernel.org, George Zhang <georgezhang@vmware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 29, 2014 at 01:13:47PM +0200, walter harms wrote:
> 
> 
> Am 29.08.2014 10:42, schrieb Dan Carpenter:
> > This is untrusted user data from vmci_host_do_send_datagram() so the
> > VMCI_DG_SIZE() macro can have an integer overflow.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
> > index f3cdd90..8226652 100644
> > --- a/drivers/misc/vmw_vmci/vmci_datagram.c
> > +++ b/drivers/misc/vmw_vmci/vmci_datagram.c
> > @@ -328,7 +328,8 @@ int vmci_datagram_dispatch(u32 context_id,
> >  
> >  	BUILD_BUG_ON(sizeof(struct vmci_datagram) != 24);
> >  
> > -	if (VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
> > +	if (dg->payload_size > VMCI_MAX_DG_SIZE ||
> > +	    VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
> >  		pr_devel("Payload (size=%llu bytes) too big to send\n",
> >  			 (unsigned long long)dg->payload_size);
> >  		return VMCI_ERROR_INVALID_ARGS;
> 
> Are your sure about that ">" ? maybe ">=" was intended ?

Yes, I'm sure.  As a rule of thumb, > is used for size comparisons and
>= is used for index comparisons.

regards,
dan carpenter

