From: Peng Tao <bergwolf@gmail.com>
Date: Fri, 25 Apr 2014 03:22:21 +0000
Subject: Re: [patch 2/2] staging: lustre: integer overflow in obd_ioctl_is_invalid()
Message-Id: <CA+a=Yy4iPJqP3Hm24i9-e8bnwdS=_8DJqtrd5K0nykRnJYNZsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140424214939.GB10490@mwanda>
In-Reply-To: <20140424214939.GB10490@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 25, 2014 at 5:49 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
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
Reviewed-by: Peng Tao <bergwolf@gmail.com>

Thanks,
Tao
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
> -       if (data->ioc_len > (1<<30)) {
> +       if (data->ioc_len > OBD_MAX_IOCTL_BUFFER) {
>                 CERROR("OBD ioctl: ioc_len larger than 1<<30\n");
>                 return 1;
>         }
> -       if (data->ioc_inllen1 > (1<<30)) {
> +       if (data->ioc_inllen1 > OBD_MAX_IOCTL_BUFFER) {
>                 CERROR("OBD ioctl: ioc_inllen1 larger than 1<<30\n");
>                 return 1;
>         }
> -       if (data->ioc_inllen2 > (1<<30)) {
> +       if (data->ioc_inllen2 > OBD_MAX_IOCTL_BUFFER) {
>                 CERROR("OBD ioctl: ioc_inllen2 larger than 1<<30\n");
>                 return 1;
>         }
> -       if (data->ioc_inllen3 > (1<<30)) {
> +       if (data->ioc_inllen3 > OBD_MAX_IOCTL_BUFFER) {
>                 CERROR("OBD ioctl: ioc_inllen3 larger than 1<<30\n");
>                 return 1;
>         }
> -       if (data->ioc_inllen4 > (1<<30)) {
> +       if (data->ioc_inllen4 > OBD_MAX_IOCTL_BUFFER) {
>                 CERROR("OBD ioctl: ioc_inllen4 larger than 1<<30\n");
>                 return 1;
>         }
