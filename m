From: Joe Perches <joe@perches.com>
Date: Wed, 28 Mar 2018 23:21:14 +0000
Subject: Re: [PATCH] ore: fix spelling mistake: "Multples" -> "multiples"
Message-Id: <1522279274.2210.15.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328230705.28145-1-colin.king@canonical.com>
In-Reply-To: <20180328230705.28145-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boaz Harrosh <ooo@electrozaur.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2018-03-29 at 00:07 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in ORE_ERR error message text and
> make it all lowercase.

thanks and more trivially:

> diff --git a/fs/exofs/ore.c b/fs/exofs/ore.c
[]
> @@ -68,7 +68,7 @@ int ore_verify_layout(unsigned total_comps, struct ore_layout *layout)
>  	}
>  	if (0 != (layout->stripe_unit & ~PAGE_MASK)) {
>  		ORE_ERR("Stripe Unit(0x%llx)"
> -			  " must be Multples of PAGE_SIZE(0x%lx)\n",
> +			  " must be multiples of PAGE_SIZE(0x%lx)\n",

"a multiple" might be more intelligible than "multiples"

It would be a more common usage too.

$ git grep -i "\".*multiples" | wc -l
10
$ git grep -i "\".*a multiple" | wc -l
62

