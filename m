From: Ian Abbott <abbotti@mev.co.uk>
Date: Tue, 27 Nov 2018 16:33:39 +0000
Subject: Re: [PATCH] staging: comedi: fix spelling mistake "desination" -> "destination"
Message-Id: <78410bc5-ec59-6ff6-f9e5-eef69abab74f@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181127142328.27287-1-colin.king@canonical.com>
In-Reply-To: <20181127142328.27287-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Spencer E . Olson" <olsonse@umich.edu>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/11/2018 14:23, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in message text in the call to unittest,
> fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/comedi/drivers/tests/ni_routes_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> index a1eda035f270..c6dc18f346e8 100644
> --- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> +++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
> @@ -372,7 +372,7 @@ void test_ni_lookup_route_register(void)
>   	unittest(ni_lookup_route_register(O(8), O(9), T) = 8,
>   		 "validate last destination\n");
>   	unittest(ni_lookup_route_register(O(10), O(9), T) = -EINVAL,
> -		 "lookup invalid desination\n");
> +		 "lookup invalid destination\n");
>   
>   	unittest(ni_lookup_route_register(rgout0_src0, TRIGGER_LINE(0), T) =
>   		 -EINVAL,
> 

Thanks for spotting that!  Looks good.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
