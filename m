From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 07:48:02 +0000
Subject: Re: [PATCH] staging: comedi: adv_pci1710: fix spelling mistake: "droput" -> "dropout"
Message-Id: <a993b7c3-29c0-ea34-0b16-1e5f7607e004@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415174945.32712-1-colin.king@canonical.com>
In-Reply-To: <20190415174945.32712-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 11:19 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/staging/comedi/drivers/adv_pci1710.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
> index 6a93b04f1fdf..dbff0f7e7cf5 100644
> --- a/drivers/staging/comedi/drivers/adv_pci1710.c
> +++ b/drivers/staging/comedi/drivers/adv_pci1710.c
> @@ -317,7 +317,7 @@ static int pci1710_ai_read_sample(struct comedi_device *dev,
>   		chan = sample >> 12;
>   		if (chan != devpriv->act_chanlist[cur_chan]) {
>   			dev_err(dev->class_dev,
> -				"A/D data droput: received from channel %d, expected %d\n",
> +				"A/D data dropout: received from channel %d, expected %d\n",
>   				chan, devpriv->act_chanlist[cur_chan]);
>   			return -ENODATA;
>   		}
