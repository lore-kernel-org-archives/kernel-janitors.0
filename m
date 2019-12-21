From: Marek Behun <marek.behun@nic.cz>
Date: Sat, 21 Dec 2019 17:00:40 +0000
Subject: Re: [PATCH] firmware: turris-mox-rwtm: fix indentation issue
Message-Id: <20191221180040.4e22c245@nic.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191221153623.32564-1-colin.king@canonical.com>
In-Reply-To: <20191221153623.32564-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,
this was sent to mvebu-next, Gregory did not apply it yet but replied
that he is going to.
Marek

On Sat, 21 Dec 2019 15:36:23 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
> index 72be58960e54..e27f68437b56 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -197,7 +197,7 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
>  		rwtm->serial_number = reply->status[1];
>  		rwtm->serial_number <<= 32;
>  		rwtm->serial_number |= reply->status[0];
> -			rwtm->board_version = reply->status[2];
> +		rwtm->board_version = reply->status[2];
>  		rwtm->ram_size = reply->status[3];
>  		reply_to_mac_addr(rwtm->mac_address1, reply->status[4],
>  				  reply->status[5]);
