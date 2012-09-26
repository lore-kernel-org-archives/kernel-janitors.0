From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 04:54:14 +0000
Subject: Re: [Patch 2/2] Staging: winbond: checkpatch cleanup for wb35tx_s.h
Message-Id: <50628A6C.80200@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5062865E.8010505@gmail.com>
In-Reply-To: <5062865E.8010505@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Please ignore this mail. I will resend the patches.
Really sorry.

On Wednesday 26 September 2012 10:06 AM, Harsh Kumar wrote:

> checkpatch cleanup for drivers/staging/winbond/wb35tx_s.h
> Removed some undesired spaces, lines and tabs to comply with coding style.
> 
> diff -uprN a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
> --- a/drivers/staging/winbond/wb35tx_s.h
> +++ b/drivers/staging/winbond/wb35tx_s.h
> @@ -4,16 +4,12 @@
>  #include "mds_s.h"
>  
>  /* IS89C35 Tx related definition */
> -#define TX_INTERFACE			0	/* Interface 1 */
> -#define TX_PIPE					3	/* Endpoint 4 */
> -#define TX_INTERRUPT			1	/* Endpoint 2 */
> +#define TX_INTERFACE		0	/* Interface 1 */
> +#define TX_PIPE			3	/* Endpoint 4 */
> +#define TX_INTERRUPT		1	/* Endpoint 2 */
>  #define MAX_INTERRUPT_LENGTH	64	/* It must be 64 for EP2 hardware */
>  
> -
> -
>  /* Internal variable for module */
> -
> -
>  struct wb35_tx {
>  	/* For Tx buffer */
>  	u8	TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
> @@ -23,15 +19,15 @@ struct wb35_tx {
>  
>  	atomic_t	TxResultCount; /* For thread control of EP2 931130.4.m */
>  	atomic_t	TxFireCounter; /* For thread control of EP4 931130.4.n */
> -	u32			ByteTransfer;
> +	u32		ByteTransfer;
>  
> -	u32	    TxSendIndex; /* The next index of Mds array to be sent */
> -	u32	    EP2vm_state; /* for EP2vm state */
> -	u32	    EP4vm_state; /* for EP4vm state */
> -	u32	    tx_halt; /* Stopping VM */
> +	u32	TxSendIndex; /* The next index of Mds array to be sent */
> +	u32	EP2vm_state; /* for EP2vm state */
> +	u32	EP4vm_state; /* for EP4vm state */
> +	u32	tx_halt; /* Stopping VM */
>  
> -	struct urb *				Tx4Urb;
> -	struct urb *				Tx2Urb;
> +	struct urb	*Tx4Urb;
> +	struct urb	*Tx2Urb;
>  
>  	int		EP2VM_status;
>  	int		EP4VM_status;
> 


