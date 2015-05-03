From: Greg KH <greg@kroah.com>
Date: Sun, 03 May 2015 18:31:45 +0000
Subject: Re: [PATCH] staging/lustre: Always try kmalloc first for OBD_ALLOC_LARGE
Message-Id: <20150503183145.GB7356@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 11:58:21PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Create libcfs_kvzalloc and libcfs_kvzalloc_cpt are
> are designed to replace OBD_ALLOC_LARGE and OBD_CPT_ALLOC_LARGE.
> 
> Not a drop-in replacement as they also take gfp flags armument
> for more flexibility.
> 
> Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
> ---
> This is how I envision the OBD_ALLOC_LARGE replacement.
> 
> BTW, it appears we also have LIBCFS_ALLOC and friends that we probably dont' need either.
> 
> Thanks your your great help!
> 
>  .../staging/lustre/include/linux/libcfs/libcfs.h   |  4 ++
>  .../staging/lustre/lustre/include/obd_support.h    | 24 ++-------
>  drivers/staging/lustre/lustre/libcfs/Makefile      |  1 +
>  .../staging/lustre/lustre/libcfs/linux/linux-mem.c | 59 ++++++++++++++++++++++
>  4 files changed, 67 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/staging/lustre/lustre/libcfs/linux/linux-mem.c
> 
> diff --git a/drivers/staging/lustre/include/linux/libcfs/libcfs.h b/drivers/staging/lustre/include/linux/libcfs/libcfs.h
> index 4410d7f..947df7e 100644
> --- a/drivers/staging/lustre/include/linux/libcfs/libcfs.h
> +++ b/drivers/staging/lustre/include/linux/libcfs/libcfs.h
> @@ -184,4 +184,8 @@ static inline void *__container_of(void *ptr, unsigned long shift)
>  
>  #define _LIBCFS_H
>  
> +void *libcfs_kvzalloc(size_t size, gfp_t flags);
> +void *libcfs_kvzalloc_cpt(struct cfs_cpt_table *cptab, int cpt, size_t size,
> +			  gfp_t flags);
> +
>  #endif /* _LIBCFS_H */
> diff --git a/drivers/staging/lustre/lustre/include/obd_support.h b/drivers/staging/lustre/lustre/include/obd_support.h
> index 2991d2e..379266d 100644
> --- a/drivers/staging/lustre/lustre/include/obd_support.h
> +++ b/drivers/staging/lustre/lustre/include/obd_support.h
> @@ -676,37 +676,19 @@ do {									      \
>  	 __OBD_VMALLOC_VEROBSE(ptr, cptab, cpt, size)
>  
>  
> -/* Allocations above this size are considered too big and could not be done
> - * atomically.
> - *
> - * Be very careful when changing this value, especially when decreasing it,
> - * since vmalloc in Linux doesn't perform well on multi-cores system, calling
> - * vmalloc in critical path would hurt performance badly. See LU-66.
> - */
> -#define OBD_ALLOC_BIG (4 * PAGE_CACHE_SIZE)
> -
>  #define OBD_ALLOC_LARGE(ptr, size)					    \
>  do {									  \
> -	if (size > OBD_ALLOC_BIG)					     \
> -		OBD_VMALLOC(ptr, size);				       \
> -	else								  \
> -		OBD_ALLOC(ptr, size);					 \
> +	ptr = libcfs_kvzalloc(size, GFP_NOFS);				  \
>  } while (0)

Just fix up all callers of these functions, if there are any anymore.

>  
>  #define OBD_CPT_ALLOC_LARGE(ptr, cptab, cpt, size)			      \
>  do {									      \
> -	if (size > OBD_ALLOC_BIG)					      \
> -		OBD_CPT_VMALLOC(ptr, cptab, cpt, size);			      \
> -	else								      \
> -		OBD_CPT_ALLOC(ptr, cptab, cpt, size);			      \
> +	ptr = libcfs_kvzalloc_cpt(cptab, cpt, size, GFP_NOFS);		      \
>  } while (0)

Same here.

>  
>  #define OBD_FREE_LARGE(ptr, size)					     \
>  do {									  \
> -	if (size > OBD_ALLOC_BIG)					     \
> -		OBD_VFREE(ptr, size);					 \
> -	else								  \
> -		OBD_FREE(ptr, size);					  \
> +	kvfree(ptr);							  \

Same here.

>  } while (0)
>  
>  
> diff --git a/drivers/staging/lustre/lustre/libcfs/Makefile b/drivers/staging/lustre/lustre/libcfs/Makefile
> index 2996a48..fabdd3e 100644
> --- a/drivers/staging/lustre/lustre/libcfs/Makefile
> +++ b/drivers/staging/lustre/lustre/libcfs/Makefile
> @@ -7,6 +7,7 @@ libcfs-linux-objs += linux-curproc.o
>  libcfs-linux-objs += linux-module.o
>  libcfs-linux-objs += linux-crypto.o
>  libcfs-linux-objs += linux-crypto-adler.o
> +libcfs-linux-objs += linux-mem.o
>  
>  libcfs-linux-objs := $(addprefix linux/,$(libcfs-linux-objs))
>  
> diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-mem.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-mem.c
> new file mode 100644
> index 0000000..1b068ae
> --- /dev/null
> +++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-mem.c
> @@ -0,0 +1,59 @@
> +/*
> + * GPL HEADER START

This line isn't needed.

> + *
> + * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.

This line isn't needed either, and in fact, is a lie, you can't force
anyone to not modify your file once it's in the kernel tree.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 only,
> + * as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License version 2 for more details (a copy is included
> + * in the LICENSE file that accompanied this code).
> + *
> + * You should have received a copy of the GNU General Public License
> + * version 2 along with this program; If not, see
> + * http://www.sun.com/software/products/lustre/docs/GPLv2.pdf
> + *
> + * GPL HEADER END

Again, not needed.

> + */
> +/*
> + * Copyright (c) 2015, Oleg Drokin <green@linuxhacker.ru>

I think your employer would like a different line here...

thanks,

greg k-h
