From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 16 Apr 2019 10:22:49 +0000
Subject: Re: [PATCH] staging: comedi: adv_pci1710: fix spelling mistake: "droput" -> "dropout"
Message-Id: <dbe5e3b9-0653-53ec-1371-88c29aed7b8d@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415174945.32712-1-colin.king@canonical.com>
In-Reply-To: <20190415174945.32712-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/04/2019 18:49, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

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
> 


-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
