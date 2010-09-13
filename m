From: Gregory Bean <gbean@codeaurora.org>
Date: Mon, 13 Sep 2010 16:23:03 +0000
Subject: Re: [PATCH] gpio: sx150x: fix error code value
Message-Id: <4C8E4FE7.4080808@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317845-5181-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317845-5181-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

>   	err = sx150x_i2c_read(chip->client, reg,&data);
>   	if (err>= 0)
> -		err = (data&  mask) != 0 ? 1 : 0;
> +		err = (data&  mask) != 0 ? -EIO : 0;
>

This doesn't work.  The IO pins are gpio data pins, which are used as 0 
or 1 data values (see sx150x_gpio_get).  Returning -EIO whenever an 
attempt is made to gpio_get_value on a non-zero gpio line will break things.

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
