From: Alan Stern <stern@rowland.harvard.edu>
Date: Fri, 09 Aug 2019 19:29:08 +0000
Subject: Re: [PATCH] USB: storage: isd200: remove redundant assignment to variable sendToTransport
Message-Id: <Pine.LNX.4.44L0.1908091528040.1630-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190809173314.4623-1-colin.king@canonical.com>
References: <20190809173314.4623-1-colin.king@canonical.com>
In-Reply-To: <20190809173314.4623-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 9 Aug 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable sendToTransport is being initialized with a value that is
> never read and is being re-assigned a little later on. The assignment
> is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")

Of what use is that tag to general kernel developers?

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/storage/isd200.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
> index 2b474d60b4db..28e1128d53a4 100644
> --- a/drivers/usb/storage/isd200.c
> +++ b/drivers/usb/storage/isd200.c
> @@ -1511,7 +1511,7 @@ static int isd200_Initialization(struct us_data *us)
>  
>  static void isd200_ata_command(struct scsi_cmnd *srb, struct us_data *us)
>  {
> -	int sendToTransport = 1, orig_bufflen;
> +	int sendToTransport, orig_bufflen;
>  	union ata_cdb ataCdb;
>  
>  	/* Make sure driver was initialized */

Otherwise:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
