From: Nathan Chancellor <natechancellor@gmail.com>
Date: Thu, 12 Nov 2020 20:12:57 +0000
Subject: Re: [PATCH] USB: storage: avoid use of uninitialized values in error path
Message-Id: <20201112201257.GA1665022@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201112191255.13372-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201112191255.13372-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org

On Thu, Nov 12, 2020 at 08:12:55PM +0100, Lukas Bulwahn wrote:
> When usb_stor_bulk_transfer_sglist() returns with USB_STOR_XFER_ERROR, it
> returns without writing to its parameter *act_len.
> 
> Further, the two callers of usb_stor_bulk_transfer_sglist():
> 
>     usb_stor_bulk_srb() and
>     usb_stor_bulk_transfer_sg(),
> 
> use the passed variable partial without checking the return value. Hence,
> the uninitialized value of partial is then used in the further execution
> of those two functions.
> 
> Clang-analyzer detects this potential control and data flow and warns:
> 
>   drivers/usb/storage/transport.c:469:40:
>     warning: The right operand of '-' is a garbage value
>     [clang-analyzer-core.UndefinedBinaryOperatorResult]
>           scsi_set_resid(srb, scsi_bufflen(srb) - partial);
>                                                 ^
> 
>   drivers/usb/storage/transport.c:495:15:
>     warning: Assigned value is garbage or undefined
>     [clang-analyzer-core.uninitialized.Assign]
>                   length_left -= partial;
>                               ^
> 
> When a transfer error occurs, the *act_len value is probably ignored by the
> higher layers. But it won't hurt to set it to a valid number, just in case.
> 
> For the two early-return paths in usb_stor_bulk_transfer_sglist(), the
> amount of data transferred is 0.  So if act_len is not NULL, set *act_len
> to 0 in those paths. That makes clang-analyzer happy.
> 
> Proposal was discussed in this mail thread:
> 
> Link: https://lore.kernel.org/linux-usb/alpine.DEB.2.21.2011112146110.13119@felia/
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Assuming that setting it to zero is okay (sounds like it is based on the
other thread), this is a reasonable fix.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> applies cleanly on current master and next-20201112
> 
> I did some basic compile testing...
> 
> Alan, Greg, please pick this minor non-urgent clean-up patch.
> 
>  drivers/usb/storage/transport.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 238a8088e17f..5eb895b19c55 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -416,7 +416,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>  
>  	/* don't submit s-g requests during abort processing */
>  	if (test_bit(US_FLIDX_ABORTING, &us->dflags))
> -		return USB_STOR_XFER_ERROR;
> +		goto usb_stor_xfer_error;
>  
>  	/* initialize the scatter-gather request block */
>  	usb_stor_dbg(us, "xfer %u bytes, %d entries\n", length, num_sg);
> @@ -424,7 +424,7 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>  			sg, num_sg, length, GFP_NOIO);
>  	if (result) {
>  		usb_stor_dbg(us, "usb_sg_init returned %d\n", result);
> -		return USB_STOR_XFER_ERROR;
> +		goto usb_stor_xfer_error;
>  	}
>  
>  	/*
> @@ -452,6 +452,11 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
>  		*act_len = us->current_sg.bytes;
>  	return interpret_urb_result(us, pipe, length, result,
>  			us->current_sg.bytes);
> +
> +usb_stor_xfer_error:
> +	if (act_len)
> +		*act_len = 0;
> +	return USB_STOR_XFER_ERROR;
>  }
>  
>  /*
> -- 
> 2.17.1
> 
