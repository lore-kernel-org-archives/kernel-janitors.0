From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 14 Mar 2015 08:44:31 +0000
Subject: Re: [PATCH v2] staging: panel: change struct bits to a bit array
Message-Id: <20150314083231.GA4120@sudip-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426288836-25749-1-git-send-email-illeida@openaliasbox.org>
In-Reply-To: <1426288836-25749-1-git-send-email-illeida@openaliasbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Isaac Lleida <illeida@openaliasbox.org>
Cc: willy@meta-x.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 14, 2015 at 12:20:36AM +0100, Isaac Lleida wrote:
> This path implements a bit array representing the LCD signal states instead of the old "struct bits", which used char to represent a single bit. This will reduce the memory usage.

commit log should wrap at 72 char

> 
> Signed-off-by: Isaac Lleida <illeida@openaliasbox.org

missing '>'

> ---
> v2: fix some stupid errors from the first patch
> 
<snip>
> +#define BIT_ON(b, m)	(b |= m)
> +#define BIT_OFF(b, m)	(b &= ~m)
> +#define BIT_CHK(b, m)	(b & m)
> +#define BIT_MOD(b, m, v)				\
> +	(((v) ? BIT_ON(b, m) : BIT_OFF(b, m))?1:0)	\
missing ' ' around ? and :

please test your patch by checkpatch.pl before sending

regards
sudip
