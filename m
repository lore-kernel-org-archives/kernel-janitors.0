From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Jun 2018 09:06:09 +0000
Subject: Re: [PATCH] media: staging: atomisp: add a blank line after declarations
Message-Id: <20180616090609.s5s4q2ri7e2x24oo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2750553.3y1WJKmnP5@joonhwan-virtualbox>
In-Reply-To: <2750553.3y1WJKmnP5@joonhwan-virtualbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "JoonHwan.Kim" <spilit464@gmail.com>
Cc: alan@linux.intel.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org

On Sat, Jun 16, 2018 at 01:30:48PM +0900, JoonHwan.Kim wrote:
> @@ -1656,6 +1659,7 @@ static void atomisp_pause_buffer_event(struct atomisp_device *isp)
>  /* invalidate. SW workaround for this is to set burst length */
>  /* manually to 128 in case of 13MPx snapshot and to 1 otherwise. */
>  static void atomisp_dma_burst_len_cfg(struct atomisp_sub_device *asd)
> +
>  {

This isn't right.

regards,
dan carpenter

