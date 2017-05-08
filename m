From: Corey Minyard <minyard@acm.org>
Date: Mon, 08 May 2017 15:18:59 +0000
Subject: Re: [PATCH] ipmi_ssif: remove redundant null check on array client->adapter->name
Message-Id: <f09ab914-8b09-b556-6168-98ae111efa35@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170507180516.24887-1-colin.king@canonical.com>
In-Reply-To: <20170507180516.24887-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/07/2017 01:05 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The null check on client->adapter->name is redundant as name is an
> array of I2C_NAME_SIZE chars and hence can never be null. We may as
> well remove this redundant check.
Thanks Colin,

Queued for next merge window.

-corey
> Detected by CoverityScan, CID#1375918 ("Array compared against 0")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_ssif.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 0b22a9be5029..d9243c5d2647 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1417,8 +1417,7 @@ static int find_slave_address(struct i2c_client *client, int slave_addr)
>   	list_for_each_entry(info, &ssif_infos, link) {
>   		if (info->binfo.addr != client->addr)
>   			continue;
> -		if (info->adapter_name && client->adapter->name &&
> -		    strcmp_nospace(info->adapter_name,
> +		if (info->adapter_name && strcmp_nospace(info->adapter_name,
>   				   client->adapter->name))
>   			continue;
>   		if (info->slave_addr) {


