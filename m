From: walter harms <wharms@bfs.de>
Date: Fri, 29 Aug 2014 11:13:47 +0000
Subject: Re: [patch] VMCI: integer overflow in vmci_datagram_dispatch()
Message-Id: <5400606B.8010905@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140829084256.GA14780@mwanda>
In-Reply-To: <20140829084256.GA14780@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, George Zhang <georgezhang@vmware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org



Am 29.08.2014 10:42, schrieb Dan Carpenter:
> This is untrusted user data from vmci_host_do_send_datagram() so the
> VMCI_DG_SIZE() macro can have an integer overflow.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
> index f3cdd90..8226652 100644
> --- a/drivers/misc/vmw_vmci/vmci_datagram.c
> +++ b/drivers/misc/vmw_vmci/vmci_datagram.c
> @@ -328,7 +328,8 @@ int vmci_datagram_dispatch(u32 context_id,
>  
>  	BUILD_BUG_ON(sizeof(struct vmci_datagram) != 24);
>  
> -	if (VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
> +	if (dg->payload_size > VMCI_MAX_DG_SIZE ||
> +	    VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
>  		pr_devel("Payload (size=%llu bytes) too big to send\n",
>  			 (unsigned long long)dg->payload_size);
>  		return VMCI_ERROR_INVALID_ARGS;

Are your sure about that ">" ? maybe ">=" was intended ?

re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
