From: Bart Van Assche <Bart.VanAssche@wdc.com>
Date: Tue, 25 Jul 2017 21:19:10 +0000
Subject: Re: [PATCH 2/2] scsi: aacraid: Off by one NUL terminator
Message-Id: <1501017548.8931.9.camel@wdc.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170725195110.uwrzzkzvrbfqv7ld@mwanda>
In-Reply-To: <20170725195110.uwrzzkzvrbfqv7ld@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "aacraid@microsemi.com" <aacraid@microsemi.com>, "Mahesh.Rajashekhara@pmcs.com" <Mahesh.Rajashekhara@pmcs.com>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Cc: "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2017-07-25 at 22:51 +0300, Dan Carpenter wrote:
> We're putting a NUL terminator one character beyond the end of the
> struct and that's obviously wrong.  On the other hand, I'm not positive
> this is the correct fix.  This change was added deliberately and was
> mentioned in the changlog of commit b836439faf04 ("aacraid: 4KB sector
> support").  The relevant section is "Also fix up a name truncation
> problem".  Can someone review this code and figure out the right thing
> to do?
> 
> Fixes: b836439faf04 ("aacraid: 4KB sector support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.c
> index 4591113c49de..22c7461f65c9 100644
> --- a/drivers/scsi/aacraid/aachba.c
> +++ b/drivers/scsi/aacraid/aachba.c
> @@ -549,7 +549,7 @@ static void get_container_name_callback(void *context, struct fib * fibptr)
>  	if ((le32_to_cpu(get_name_reply->status) == CT_OK)
>  	 && (get_name_reply->data[0] != '\0')) {
>  		char *sp = get_name_reply->data;
> -		sp[sizeof(((struct aac_get_name_resp *)NULL)->data)] = '\0';
> +		sp[sizeof(((struct aac_get_name_resp *)NULL)->data) - 1] = '\0';
>  		while (*sp == ' ')
>  			++sp;
>  		if (*sp) {

Hello Dan,

If others agree with the approach of this patch, please use FIELD_SIZEOF()
instead of leaving it open-coded.

Thanks,

Bart.