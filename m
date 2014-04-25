From: walter harms <wharms@bfs.de>
Date: Fri, 25 Apr 2014 07:13:21 +0000
Subject: Re: [patch 2/2] staging: lustre: integer overflow in obd_ioctl_is_invalid()
Message-Id: <535A0B11.8010903@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140424214939.GB10490@mwanda>
In-Reply-To: <20140424214939.GB10490@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 24.04.2014 23:49, schrieb Dan Carpenter:
> The obd_ioctl_getdata() function caps "data->ioc_len" at
> OBD_MAX_IOCTL_BUFFER and then calls this obd_ioctl_is_invalid() to check
> that the other values inside data are valid.
> 
> There are several lengths inside data but when they are added together
> they must not be larger than "data->ioc_len".  The checks against
> "(data->ioc_inllen1 > (1<<30))" are supposed to ensure that the addition
> does not have an integer overflow.  But "(1<<30) * 4" actually can
> overflow 32 bits so the checks are insufficient.
> 
> I have changed it to "> OBD_MAX_IOCTL_BUFFER" instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/lustre/lustre/include/lustre_lib.h b/drivers/staging/lustre/lustre/include/lustre_lib.h
> index 0368ca6..04f549e 100644
> --- a/drivers/staging/lustre/lustre/include/lustre_lib.h
> +++ b/drivers/staging/lustre/lustre/include/lustre_lib.h
> @@ -192,23 +192,23 @@ static inline int obd_ioctl_packlen(struct obd_ioctl_data *data)
>  
>  static inline int obd_ioctl_is_invalid(struct obd_ioctl_data *data)
>  {
> -	if (data->ioc_len > (1<<30)) {
> +	if (data->ioc_len > OBD_MAX_IOCTL_BUFFER) {
>  		CERROR("OBD ioctl: ioc_len larger than 1<<30\n");
>  		return 1;
>  	}

I would suggest to adjust the errormsg also like:
CERROR("OBD ioctl: ioc_len larger than OBD_MAX_IOCTL_BUFFER\n");

otherwise future debuggers will be confused.

just my 2 cents

re,
 wh



> -	if (data->ioc_inllen1 > (1<<30)) {
> +	if (data->ioc_inllen1 > OBD_MAX_IOCTL_BUFFER) {
>  		CERROR("OBD ioctl: ioc_inllen1 larger than 1<<30\n");
>  		return 1;
>  	}
> -	if (data->ioc_inllen2 > (1<<30)) {
> +	if (data->ioc_inllen2 > OBD_MAX_IOCTL_BUFFER) {
>  		CERROR("OBD ioctl: ioc_inllen2 larger than 1<<30\n");
>  		return 1;
>  	}
> -	if (data->ioc_inllen3 > (1<<30)) {
> +	if (data->ioc_inllen3 > OBD_MAX_IOCTL_BUFFER) {
>  		CERROR("OBD ioctl: ioc_inllen3 larger than 1<<30\n");
>  		return 1;
>  	}
> -	if (data->ioc_inllen4 > (1<<30)) {
> +	if (data->ioc_inllen4 > OBD_MAX_IOCTL_BUFFER) {
>  		CERROR("OBD ioctl: ioc_inllen4 larger than 1<<30\n");
>  		return 1;
>  	}
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
