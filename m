From: Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Fri, 22 Sep 2017 16:44:02 +0000
Subject: Re: [Intel-wired-lan] [PATCH] i40e: make const array patterns static, reduces object code size
Message-Id: <20170922094402.00001ad2@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922141138.13038-1-colin.king@canonical.com>
In-Reply-To: <20170922141138.13038-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, jesse.brandeburg@intel.com

On Fri, 22 Sep 2017 15:11:38 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const array patterns on the stack, instead make it
> static. Makes the object code smaller by over 60 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    1953	    496	      0	   2449	    991	i40e_diag.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    1798	    584	      0	   2382	    94e	i40e_diag.o
> 
> (gcc 6.3.0, x86-64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks good, thanks Colin!

Acked-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
