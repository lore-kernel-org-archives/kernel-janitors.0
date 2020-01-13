From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 13 Jan 2020 12:27:12 +0000
Subject: Re: [PATCH] HID: logitech-hidpp: avoid duplicate error handling code in 'hidpp_probe()'
Message-Id: <nycvar.YFH.7.76.2001131327020.31058@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191226145435.8262-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 26 Dec 2019, Christophe JAILLET wrote:

> 'hid_hw_stop()' is already in the error handling path when branching to
> the 'hid_hw_open_fail' label.
> There is no point in calling it twice, so remove one.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index bb063e7d48df..70e1cb928bf0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3817,7 +3817,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
>  			__func__, ret);
> -		hid_hw_stop(hdev);
>  		goto hid_hw_open_fail;

Thanks for catching this. Applied now.

-- 
Jiri Kosina
SUSE Labs
