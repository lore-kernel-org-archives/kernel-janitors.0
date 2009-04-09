From: Jean Delvare <khali@linux-fr.org>
Date: Thu, 09 Apr 2009 12:43:34 +0000
Subject: Re: [PATCH 13/56] i2c: Remove void casts
Message-Id: <20090409144334.4c283ef2@hyperion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Hi Jack,

On Wed,  8 Apr 2009 12:21:45 +0100, Jack Stone wrote:
> Remove uneeded void casts
> 
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>

WARNING: Signed-off-by: is the preferred form

> ---
>  drivers/i2c/i2c-core.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index b6f3a0d..1578645 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -1510,7 +1510,7 @@ struct i2c_adapter* i2c_get_adapter(int id)
>  	struct i2c_adapter *adapter;
>  
>  	mutex_lock(&core_lock);
> -	adapter = (struct i2c_adapter *)idr_find(&i2c_adapter_idr, id);
> +	adapter = idr_find(&i2c_adapter_idr, id);
>  	if (adapter && !try_module_get(adapter->owner))
>  		adapter = NULL;
>  

Applied, thanks.

-- 
Jean Delvare
