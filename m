From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Sep 2012 20:18:54 +0000
Subject: Re: [Patch 1/5] Staging: winbond: Changed c99 comments to c89 comments
Message-Id: <20120926201854.GC4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50634165.3010701@gmail.com>
In-Reply-To: <50634165.3010701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2012 at 11:24:45PM +0530, Harsh Kumar wrote:
> checkpatch cleanup: Changed c99 comments to c89 comments
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

Looks fine.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

As you're updating these, feel free to read them and correct grammar
and spelling mistakes.  If the comment is not needed then go ahead
and delete it.

You can do all that in the same patch I think and it's no problem.

> -		TSTATUS.value = T02.value;  //20061009 anson's endian
> +		TSTATUS.value = T02.value;  /* 20061009 anson's endian */
                                             ^^^^^^^^^^^^^^^^^^^^^^^^^
These type of comments come from people who don't use version
control.  :P  Delete them.

>  		Mds_SendComplete( adapter, &TSTATUS );
>  		T02.value = cpu_to_le32(pltmp[i]) >> 8;
>  	}
> @@ -262,9 +263,7 @@ static void Wb35Tx_EP2VM(struct wbsoft_p
>  	if (pWb35Tx->tx_halt)
>  		goto error;
>  
> -	//
> -	// Issuing URB
> -	//
> +	/* Issuing URB */

This is sort of an obvious comment.  Also it's copied in several
places.  Feel free to delete it if it looks obvious to you, but if
you're not sure then leave it in.


>  	usb_fill_int_urb( pUrb, pHwData->udev, usb_rcvintpipe(pHwData->udev,2),
>  			  pltmp, MAX_INTERRUPT_LENGTH, Wb35Tx_EP2VM_complete, adapter, 32);
>  
> @@ -287,7 +286,7 @@ void Wb35Tx_EP2VM_start(struct wbsoft_pr
>  	struct hw_data * pHwData = &adapter->sHwData;
>  	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
>  
> -	// Allow only one thread to run into function
> +	/* Allow only one thread to run into function */
>  	if (atomic_inc_return(&pWb35Tx->TxResultCount) = 1) {
>  		pWb35Tx->EP2vm_state = VM_RUNNING;
>  		Wb35Tx_EP2VM(adapter);Changed c99 comments to c89 comments
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Somehow your patch got corrupted a bit but it still applies fine
with fuzz.

regards,
dan carpenter
