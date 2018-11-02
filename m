From: Corey Minyard <minyard@acm.org>
Date: Fri, 02 Nov 2018 19:43:37 +0000
Subject: Re: [PATCH] ipmi: clean an indentation issue, remove extraneous space
Message-Id: <72af05e6-68b8-b8c0-b6ac-a5a6fe327e73@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181030114652.17167-1-colin.king@canonical.com>
In-Reply-To: <20181030114652.17167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/30/18 6:46 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to clean up an indentation issue, remove space


Queued for next release, thanks.

-corey


> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_ssif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index d06e00e95891..a7701af8fcf2 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1792,7 +1792,7 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   			       ssif_info,
>   			       &ssif_info->client->dev,
>   			       slave_addr);
> -	 if (rv) {
> +	if (rv) {
>   		pr_err("Unable to register device: error %d\n", rv);
>   		goto out_remove_attr;
>   	}
