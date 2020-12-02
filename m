From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 02 Dec 2020 19:32:05 +0000
Subject: Re: [PATCH] iio: sx9310: Off by one in sx9310_read_thresh()
Message-Id: <160693752506.2717324.7949030069848316774@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8XqwK0z//8sSWJR@mwanda>
In-Reply-To: <X8XqwK0z//8sSWJR@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Daniel Campello <campello@chromium.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Douglas Anderson <dianders@chromium.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2020-11-30 23:03:28)
> This > should be >= to prevent reading one element beyond the end of
> the sx9310_pthresh_codes[] array.
> 
> Fixes: ad2b473e2ba3 ("iio: sx9310: Support setting proximity thresholds")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
