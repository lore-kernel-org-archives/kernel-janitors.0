From: Andrea Mayer <andrea.mayer@uniroma2.it>
Date: Mon, 07 Dec 2020 19:59:26 +0000
Subject: Re: [PATCH][next] seg6: fix unintentional integer overflow on left shift
Message-Id: <20201207205926.6222eca38744c43632248a41@uniroma2.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207144503.169679-1-colin.king@canonical.com>
In-Reply-To: <20201207144503.169679-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Stefano Salsano <stefano.salsano@uniroma2.it>, Paolo Lungaroni <paolo.lungaroni@cnit.it>, Ahmed Abdelsalam <ahabdels.dev@gmail.com>, Andrea Mayer <andrea.mayer@uniroma2.it>

On Mon,  7 Dec 2020 14:45:03 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the integer value 1 is evaluated using 32-bit arithmetic
> and then used in an expression that expects a unsigned long value
> leads to a potential integer overflow. Fix this by using the BIT
> macro to perform the shift to avoid the overflow.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: 964adce526a4 ("seg6: improve management of behavior attributes")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv6/seg6_local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index b07f7c1c82a4..d68de8cd1207 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -1366,7 +1366,7 @@ static void __destroy_attrs(unsigned long parsed_attrs, int max_parsed,
>  	 * attribute; otherwise, we call the destroy() callback.
>  	 */
>  	for (i = 0; i < max_parsed; ++i) {
> -		if (!(parsed_attrs & (1 << i)))
> +		if (!(parsed_attrs & BIT(i)))
>  			continue;
>  
>  		param = &seg6_action_params[i];
> -- 
> 2.29.2
>

Hi Colin,
thanks for the fix. I've just given a look a the whole seg6_local.c code and I
found that such issues is present in other parts of the code.

If we agree, I can make a fix which explicitly eliminates the several (1 << i)
in favor of BIT(i).

Andrea
