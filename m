From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 28 May 2006 11:42:42 +0000
Subject: Re: [KJ] how to handle Kconfig ?
Message-Id: <20060528114242.GA3955@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <446C9075.5040906@bfs.de>
In-Reply-To: <446C9075.5040906@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 18, 2006 at 05:19:17PM +0200, walter harms wrote:

> hi list,
> i was playing with 'make randconfig' and found that some issues are 
> rooted in the kconfig selection.
> e.g.:
> you can select X86_NUMAQ without SMP what makes no sence since NUMAQ 
> depends on SMP. (adding 'depends on SMP' helps).
> 
> Should that be fixed ? does anyone care ?

This was already fixed in Linus' tree two months ago with commit 
905c399594f85322a4e513a4b0365b70d6de9fd0 .

> re,
>  walter

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
