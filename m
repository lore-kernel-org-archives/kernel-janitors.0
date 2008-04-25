From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 25 Apr 2008 18:27:35 +0000
Subject: Re: [PATCH] The function register_chrdev_region() for count=0 returns a false success.This patch pre
Message-Id: <20080425182734.GJ14990@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 25, 2008 at 11:55:25PM +0530, anubhav rakshit wrote:
> +	if(unlikely(count = 0))

A space between 'if' and '(', please.  scripts/checkpatch.pl can warn
you about this kind of thing.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
