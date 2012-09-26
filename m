From: Greg KH <greg@kroah.com>
Date: Wed, 26 Sep 2012 21:02:24 +0000
Subject: Re: [Patch 1/5] Staging: winbond: Changed c99 comments to c89 comments
Message-Id: <20120926210224.GA27011@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50634165.3010701@gmail.com>
In-Reply-To: <50634165.3010701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2012 at 11:24:45PM +0530, Harsh Kumar wrote:
> @@ -287,7 +286,7 @@ void Wb35Tx_EP2VM_start(struct wbsoft_pr
>  	struct hw_data * pHwData = &adapter->sHwData;
>  	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
>  
> -	// Allow only one thread to run into function
> +	/* Allow only one thread to run into function */
>  	if (atomic_inc_return(&pWb35Tx->TxResultCount) = 1) {
>  		pWb35Tx->EP2vm_state = VM_RUNNING;
>  		Wb35Tx_EP2VM(adapter);Changed c99 comments to c89 comments

What's with that last line?  It's not correct, did your email client get
messed up?

odd...

greg k-h
