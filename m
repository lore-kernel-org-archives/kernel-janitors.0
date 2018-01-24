From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jan 2018 21:21:56 +0000
Subject: Re: [PATCH] byteorder: silence warning by use the proper type
Message-Id: <20180124212156.3ftylyibl3fqgq4u@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180124190725.4rj5yban2heqd65r@smtp.gmail.com>
In-Reply-To: <20180124190725.4rj5yban2heqd65r@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Cc: mika.westerberg@linux.intel.com, michael.jamet@intel.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 24, 2018 at 05:07:25PM -0200, rodrigosiqueira wrote:
> This patch fixes the GCC warning:
> 
> warning: comparison between signed and unsigned integer expressions
> [-Wsign-compare]
>   for (i = 0; i < len; i++)
>                 ^

I wish GCC wouldn't generate warnings which are clearly dumb.  :(  This
kind of warning has a over 99% false positive rate in finding real bugs.

regards,
dan carpenter

