From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 21 Sep 2012 19:33:53 +0000
Subject: Re: [next:akpm 202/376] arch/sh/kernel/ioport.c:14:15: error: conflicting type qualifiers for 'sh_io
Message-Id: <20120921123353.b1682e00.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921105635.GA13728@localhost>
In-Reply-To: <20120921105635.GA13728@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 21 Sep 2012 07:51:53 -0700
Andi Kleen <ak@linux.intel.com> wrote:

> On Fri, Sep 21, 2012 at 06:56:35PM +0800, Fengguang Wu wrote:
> > Hi Andi,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> > head:   69921c36f9e0e4e7952fa2583bf2d33713835eaf
> > commit: 11f7c1c694b94586a232a50eebdd623255d60d72 [202/376] sections: fix section conflicts in arch/sh
> > config: sh-titan_defconfig
> 
> Does this patch work?
> 
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index 0cf60a6..73a23f4 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -134,7 +134,7 @@ __BUILD_MEMORY_STRING(__raw_, q, u64)
>   * load/store instructions. sh_io_port_base is the virtual address to
>   * which all ports are being mapped.
>   */
> -extern const unsigned long sh_io_port_base;
> +extern unsigned long sh_io_port_base;
>  
>  static inline void __set_io_port_base(unsigned long pbase)
>  {

yup.
