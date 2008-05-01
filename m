From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 01 May 2008 19:16:27 +0000
Subject: Re: [PATCH 1/1] mmap: fix uninitialized entities warnings.
Message-Id: <20080501191626.GW14976@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
In-Reply-To: <1209668812-17641-1-git-send-email-ricardo@scarybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 01, 2008 at 08:06:52PM +0100, Ricardo Martins wrote:
> This is my first patch for the Linux kernel. It fixes the following
> warnings given by gcc 4.3.0 about uninitialzed entities in mmap.c:

First, it's generally a bad idea to fix these warnings.  They sometimes
obscure real bugs.

> I'd appreciate some feedback.

>   *		x: (no) no	x: (no) yes	x: (no) yes	x: (yes) yes
> - *		
> + *

Don't mix whitespace changes with other changes.

> -	struct vm_area_struct *vma, *prev;
> +	struct vm_area_struct *vma, *prev = NULL;

gcc bug -- it's failing to notice that find_vma_prepare() will always
initialise pprev.

> -	struct rb_node **rb_link, *rb_parent;
> +	struct rb_node **rb_link = NULL, *rb_parent = NULL;

Likewise.

The other changes in your patch are either whitespace or fixes for the
same gcc problem.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
