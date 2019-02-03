From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 03 Feb 2019 11:29:04 +0000
Subject: Re: [PATCH] staging: comedi: dt2811: fix integer overflow in multiply
Message-Id: <20190203112904.GA2563@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190202215916.25753-1-colin.king@canonical.com>
In-Reply-To: <20190202215916.25753-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 02, 2019 at 09:59:16PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Multiplying two unsigned ints leads to an unsigned int result. The
> intention is that the result is a unsigned long long, so to fix the
> overflow cast the div to an unsigned long long to ensure that the
> multiplication is on unsigned long longs to avoid overflow.
> 
> Detected by CoverityScan, CID#1357597 ("Unintentioal integer overflow")
> 
> Fixes: f2975a9b2ab9 ("staging: comedi: dt2811: add async command support for AI subdevice")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/comedi/drivers/dt2811.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/dt2811.c b/drivers/staging/comedi/drivers/dt2811.c
> index 05207a519755..820e75f850ff 100644
> --- a/drivers/staging/comedi/drivers/dt2811.c
> +++ b/drivers/staging/comedi/drivers/dt2811.c
> @@ -323,7 +323,8 @@ static unsigned int dt2811_ns_to_timer(unsigned int *nanosec,
>  		for (_mult = 0; _mult <= 7; _mult++) {
>  			unsigned int div = dt2811_clk_dividers[_div];
>  			unsigned int mult = dt2811_clk_multipliers[_mult];
> -			unsigned long long divider = div * mult;
> +			unsigned long long divider > +				(unsigned long long)div * mult;

The max "div" can be is 12.  The max "mult" can be is 10,000,000.  So
this is a false positive because there is no overflow.  The code is not
complicated.  Unfortunately, Smatch has the exact same problem...

We should fix the checker instead of the code.

regards,
dan carpenter
