From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 12 Feb 2020 14:06:58 +0000
Subject: Re: [PATCH] HID: alps: Fix an error handling path in 'alps_input_configured()'
Message-Id: <nycvar.YFH.7.76.2002121506510.3144@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204033525.10871-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191204033525.10871-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benjamin.tissoires@redhat.com, masaki.ota@jp.alps.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 4 Dec 2019, Christophe JAILLET wrote:

> They are issues:
>    - if 'input_allocate_device()' fails and return NULL, there is no need
>      to free anything and 'input_free_device()' call is a no-op. It can
>      be axed.
>    - 'ret' is known to be 0 at this point, so we must set it to a
>      meaningful value before returning
> 
> Fixes: 2562756dde55 ("HID: add Alps I2C HID Touchpad-Stick support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index ae79a7c66737..fa704153cb00 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -730,7 +730,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	if (data->has_sp) {
>  		input2 = input_allocate_device();
>  		if (!input2) {
> -			input_free_device(input2);
> +			ret = -ENOMEM;
>  			goto exit;
>  		}

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs
