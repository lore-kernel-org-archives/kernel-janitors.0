From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 21 Jul 2012 10:31:26 +0000
Subject: Re: [uapi:uapi-split 43/74] arch/alpha/include/uapi/asm/posix_types.h:15:37: fatal error:
Message-Id: <20120721103126.GA10852@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120721052139.GA9300@localhost>
In-Reply-To: <20120721052139.GA9300@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 21, 2012 at 10:39:27AM +0100, David Howells wrote:
> 
> Bah.  Needed the attached in an early patch.  I even got it right in the patch
> comment.

..and sure it worked! :) 

Thanks,
Fengguang

> David
> ---
> diff --git a/Makefile b/Makefile
> index 08d4a06..653ee30 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -354,7 +354,7 @@ CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage
>  USERINCLUDE    := \
>  		-I$(srctree)/arch/$(hdr-arch)/include/uapi \
>  		-Iarch/$(hdr-arch)/include/generated/uapi \
> -		-Iinclude/uapi \
> +		-I$(srctree)/include/uapi \
>  		-Iinclude/generated/uapi \
>                  -include $(srctree)/include/linux/kconfig.h
>  
