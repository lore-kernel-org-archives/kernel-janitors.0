From: Corey Minyard <minyard@acm.org>
Date: Thu, 28 Sep 2017 17:31:23 +0000
Subject: Re: [PATCH][ipmi-next] ipmi: remove redundant initialization of bmc
Message-Id: <9f2f6048-64d0-ec82-43b1-f101d5a77f8c@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170928132254.7639-1-colin.king@canonical.com>
In-Reply-To: <20170928132254.7639-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/28/2017 08:22 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer bmc is being initialized and this initialized value is
> never being read, so this is assignment redundant and can be removed.
> Cleans up clang warning:
>
> warning: Value stored to 'bmc' during its initialization is never read

yes, obviously unneeded.=C2=A0 Queued.

Thanks,

-corey

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_msghandler.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi=
_msghandler.c
> index c29d46bef6b3..9de189db2cc3 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -2941,7 +2941,7 @@ static int __ipmi_bmc_register(ipmi_smi_t intf,
>   			       bool guid_set, guid_t *guid, int intf_num)
>   {
>   	int               rv;
> -	struct bmc_device *bmc =3D intf->bmc;
> +	struct bmc_device *bmc;
>   	struct bmc_device *old_bmc;
>  =20
>   	/*


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
