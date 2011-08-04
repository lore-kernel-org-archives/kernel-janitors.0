From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 04 Aug 2011 21:46:54 +0000
Subject: Re: [PATCH 2/2] HID: kfree() NULL pointer cleanup
Message-Id: <alpine.LNX.2.00.1108042346450.32288@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312490626-14838-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1312490626-14838-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bojan Prtvar <prtvar.b@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 4 Aug 2011, Bojan Prtvar wrote:

> Checking for NULL pointers before kfree() is redundant.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
>  drivers/hid/hid-zydacron.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-zydacron.c b/drivers/hid/hid-zydacron.c
> index e903715..1ad85f2 100644
> --- a/drivers/hid/hid-zydacron.c
> +++ b/drivers/hid/hid-zydacron.c
> @@ -201,9 +201,7 @@ static void zc_remove(struct hid_device *hdev)
>  	struct zc_device *zc = hid_get_drvdata(hdev);
>  
>  	hid_hw_stop(hdev);
> -
> -	if (NULL != zc)
> -		kfree(zc);
> +	kfree(zc);
>  }

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
