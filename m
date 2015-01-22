From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Jan 2015 16:21:36 +0000
Subject: Re: [patch] Input: cyapa - off by on in cyapa_update_fw_store()
Message-Id: <20150122162136.GB18153@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150122074801.GA11491@mwanda>
In-Reply-To: <20150122074801.GA11491@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Dudley Du <dudl@cypress.com>, Jingoo Han <jg1.han@samsung.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 22, 2015 at 10:48:01AM +0300, Dan Carpenter wrote:
> If "(count = NAME_MAX)" then we could end up putting the NUL terminator
> one space beyond the end of the fw_name[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

> 
> diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
> index 64c6128..58f4f6f 100644
> --- a/drivers/input/mouse/cyapa.c
> +++ b/drivers/input/mouse/cyapa.c
> @@ -1013,7 +1013,7 @@ static ssize_t cyapa_update_fw_store(struct device *dev,
>  	char fw_name[NAME_MAX];
>  	int ret, error;
>  
> -	if (count > NAME_MAX) {
> +	if (count >= NAME_MAX) {
>  		dev_err(dev, "File name too long\n");
>  		return -EINVAL;
>  	}

-- 
Dmitry
