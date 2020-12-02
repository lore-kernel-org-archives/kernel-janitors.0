From: "Ernst, Justin" <justin.ernst@hpe.com>
Date: Wed, 02 Dec 2020 20:50:35 +0000
Subject: RE: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-Id: <AT5PR8401MB1300A04A58C46C822424F46787F30@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8eoN/jMAJb3H3iv@mwanda>
In-Reply-To: <X8eoN/jMAJb3H3iv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>, Borislav Petkov <bp@suse.de>, "Wahl, Steve" <steve.wahl@hpe.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> Return -ENOMEM on allocation failure instead of returning success.
> 
> Fixes: 4fc2cf1f2daf ("x86/platform/uv: Add new uv_sysfs platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for taking the time to find this.

Reviewed-by: Justin Ernst <justin.ernst@hpe.com> 
(With an acknowledgement of Boris's 's/success/random stack memory contents/' comment)

> ---
>  drivers/platform/x86/uv_sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 54c342579f1c..e17ce8c4cdad 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -248,6 +248,7 @@ static int uv_hubs_init(void)
>  		uv_hubs[i] = kzalloc(sizeof(*uv_hubs[i]), GFP_KERNEL);
>  		if (!uv_hubs[i]) {
>  			i--;
> +			ret = -ENOMEM;
>  			goto err_hubs;
>  		}
> 
> --
> 2.29.2
