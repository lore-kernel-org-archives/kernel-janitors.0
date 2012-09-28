From: Pavel Machek <pavel@ucw.cz>
Date: Fri, 28 Sep 2012 21:15:05 +0000
Subject: Re: [Patch 4/5] Staging: winbond: checkpatch cleanup
Message-Id: <20120928211505.GB30718@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <506343F6.4040905@gmail.com>
In-Reply-To: <506343F6.4040905@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed 2012-09-26 23:35:42, Harsh Kumar wrote:
> checkpatch cleanup: Corrected wrong placement of a brace and line exceeding 80 characters
> 
> Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

ACK.

> ---
>  drivers/staging/winbond/wb35tx.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff -uprN a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
> --- a/drivers/staging/winbond/wb35tx.c
> +++ b/drivers/staging/winbond/wb35tx.c
> @@ -135,8 +135,7 @@ unsigned char Wb35Tx_initial(struct hw_d
>  		return false;
>  
>  	pWb35Tx->Tx2Urb = usb_alloc_urb(0, GFP_ATOMIC);
> -	if (!pWb35Tx->Tx2Urb)
> -	{
> +	if (!pWb35Tx->Tx2Urb) {
>  		usb_free_urb(pWb35Tx->Tx4Urb);
>  		return false;
>  	}
> @@ -263,7 +262,8 @@ static void Wb35Tx_EP2VM(struct wbsoft_p
>  
>  	/* Issuing URB */
>  	usb_fill_int_urb(pUrb, pHwData->udev, usb_rcvintpipe(pHwData->udev, 2),
> -			  pltmp, MAX_INTERRUPT_LENGTH, Wb35Tx_EP2VM_complete, adapter, 32);
> +			 pltmp, MAX_INTERRUPT_LENGTH, Wb35Tx_EP2VM_complete,
> +			 adapter, 32);
>  
>  	pWb35Tx->EP2vm_state = VM_RUNNING;
>  	retv = usb_submit_urb(pUrb, GFP_ATOMIC);

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
