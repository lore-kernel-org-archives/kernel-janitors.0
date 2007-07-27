From: Jeff Dike <jdike@addtoit.com>
Date: Fri, 27 Jul 2007 16:35:41 +0000
Subject: Re: [PATCH 18/68] 0 -> NULL, for arch/um
Message-Id: <20070727163541.GA6930@c2.user-mode-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270945.LAA17372@ifs.emn.fr>
In-Reply-To: <200707270945.LAA17372@ifs.emn.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Jul 27, 2007 at 11:45:56AM +0200, Yoann Padioleau wrote:
> When comparing a pointer, it's clearer to compare it to NULL than to 0.

ACK

>  sys-i386/fault.c   |    2 +-
>  sys-x86_64/fault.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Except you should probably diff from the top of the kernel tree.

				Jeff

-- 
Work email - jdike at linux dot intel dot com
