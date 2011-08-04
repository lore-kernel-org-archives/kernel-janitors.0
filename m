From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 04 Aug 2011 21:52:23 +0000
Subject: Re: [PATCH 1/2 v2] HID: kfree() NULL pointer cleanup
Message-Id: <alpine.LNX.2.00.1108042352100.32288@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312494408-15500-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1312494408-15500-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bojan Prtvar <prtvar.b@gmail.com>
Cc: julia@diku.dk, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 4 Aug 2011, Bojan Prtvar wrote:

> Checking for NULL pointers before kfree() is redundant.
> v2:
> No need for freeing pm in case when it's not allocated.
> 
> Reported-by: Julia Lawall <julia@diku.dk>
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  drivers/hid/hid-prodikeys.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
> index 158b389..f779009 100644
> --- a/drivers/hid/hid-prodikeys.c
> +++ b/drivers/hid/hid-prodikeys.c
> @@ -816,7 +816,7 @@ static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (pm = NULL) {
>  		hid_err(hdev, "can't alloc descriptor\n");
>  		ret = -ENOMEM;
> -		goto err_free;
> +		goto err_free_pk;
>  	}
>  
>  	pm->pk = pk;
> @@ -849,10 +849,10 @@ static int pk_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  err_stop:
>  	hid_hw_stop(hdev);
>  err_free:
> -	if (pm != NULL)
> -		kfree(pm);
> -
> +	kfree(pm);
> +err_free_pk:
>  	kfree(pk);
> +
>  	return ret;
>  }
>  

Applied, thanks to both.

-- 
Jiri Kosina
SUSE Labs
