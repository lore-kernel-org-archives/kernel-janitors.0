From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 21 Jul 2012 05:29:36 +0000
Subject: Re: [uapi:uapi-split 43/74] arch/alpha/include/uapi/asm/posix_types.h:15:37: fatal error:
Message-Id: <20120721052936.GA9396@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120721052139.GA9300@localhost>
In-Reply-To: <20120721052139.GA9300@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> arch/alpha/include/uapi/asm/posix_types.h:15:37: fatal error: asm-generic/posix_types.h: No such file or directory

Here is a complete list of impacted archs:

arch/alpha/include/uapi/asm/posix_types.h:15:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/arm/include/uapi/asm/posix_types.h:35:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/blackfin/include/generated/asm/types.h:1:31: fatal error: asm-generic/types.h: No such file or directory
arch/cris/include/uapi/asm/posix_types.h:33:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/frv/include/uapi/asm/posix_types.h:23:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/parisc/include/uapi/asm/posix_types.h:22:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/s390/include/uapi/asm/posix_types.h:52:37: fatal error: asm-generic/posix_types.h: No such file or directory
arch/x86/include/uapi/asm/types.h:4:31: fatal error: asm-generic/types.h: No such file or directory
arch/xtensa/include/uapi/asm/posix_types.h:37:37: fatal error: asm-generic/posix_types.h: No such file or directory

Thanks,
Fengguang

> vim +15 arch/alpha/include/uapi/asm/posix_types.h
>     12	
>     13	typedef unsigned long	__kernel_sigset_t;	/* at least 32 bits */
>     14	
>   > 15	#include <asm-generic/posix_types.h>
>     16	
>     17	#endif /* _ALPHA_POSIX_TYPES_H */
