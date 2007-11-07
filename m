From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 07 Nov 2007 12:48:38 +0000
Subject: Re: [PATCH] use "is_power_of_2()" macro for simplicity.
Message-Id: <20071107124838.GL4113@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711070301540.8914@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0711070301540.8914@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 07, 2007 at 03:03:39AM -0500, Robert P. J. Day wrote:
>  	 */
> -	if (size & (size - 1)) {
> +	if (!is_power_of_2(size)) {
>  		BUG_ON(size > 0x80000000);
>  		size = roundup_pow_of_two(size);
>  	}

Why not just delete the if?

	BUG_ON(size > 0x80000000);
	size = roundup_pow_of_two(size);

It's not a fast-path, and we'll consume a little less .text

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
