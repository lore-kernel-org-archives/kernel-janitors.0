From: Okash Khawaja <okash.khawaja@gmail.com>
Date: Wed, 28 Jun 2017 20:29:58 +0000
Subject: Re: [PATCH] staging: speakup: make function ser_to_dev static
Message-Id: <20170628202958.GA4220@sanghar>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628131351.22106-1-colin.king@canonical.com>
In-Reply-To: <20170628131351.22106-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Dan Carpenter <dan.carpenter@oracle.com>, Rui Teng <rui.teng@linux.vnet.ibm.com>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Wed, Jun 28, 2017 at 02:13:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The helper function ser_to_dev does not need to be in global scope, so
> make it static.
> 
> Cleans up sparse warning:
> "warning: symbol 'ser_to_dev' was not declared. Should it be static?"
Thanks very much!

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Okash Khawaja <okash.khawaja@gmail.com>

> ---
>  drivers/staging/speakup/spk_ttyio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/speakup/spk_ttyio.c b/drivers/staging/speakup/spk_ttyio.c
> index 442f191a017e..ed8e96b06ead 100644
> --- a/drivers/staging/speakup/spk_ttyio.c
> +++ b/drivers/staging/speakup/spk_ttyio.c
> @@ -21,7 +21,7 @@ struct spk_ldisc_data {
>  static struct spk_synth *spk_ttyio_synth;
>  static struct tty_struct *speakup_tty;
>  
> -int ser_to_dev(int ser, dev_t *dev_no)
> +static int ser_to_dev(int ser, dev_t *dev_no)
>  {
>  	if (ser < 0 || ser > (255 - 64)) {
>  		pr_err("speakup: Invalid ser param. Must be between 0 and 191 inclusive.\n");
> -- 
> 2.11.0
> 
