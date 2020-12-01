From: Doug Anderson <dianders@chromium.org>
Date: Tue, 01 Dec 2020 15:43:27 +0000
Subject: Re: [PATCH] iio: sx9310: Off by one in sx9310_read_thresh()
Message-Id: <CAD=FV=WVqTX1Ct4wNMghp2+kmz+J5D18r_g9FHF7dQtHUREaoQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8XqwK0z//8sSWJR@mwanda>
In-Reply-To: <X8XqwK0z//8sSWJR@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Campello <campello@chromium.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio <linux-iio@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Mon, Nov 30, 2020 at 11:03 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This > should be >= to prevent reading one element beyond the end of
> the sx9310_pthresh_codes[] array.
>
> Fixes: ad2b473e2ba3 ("iio: sx9310: Support setting proximity thresholds")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iio/proximity/sx9310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
