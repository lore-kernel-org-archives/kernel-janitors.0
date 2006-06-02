From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 02 Jun 2006 09:42:52 +0000
Subject: Re: [KJ] how to handle Kconfig ?
Message-Id: <20060602094252.GK3955@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <446C9075.5040906@bfs.de>
In-Reply-To: <446C9075.5040906@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, May 28, 2006 at 05:56:26PM +0200, walter harms wrote:
> that is nice to read but does not answer my question:
> 1. Should every not working combination by fixed ?
> 2. Is this a problem for the Janitor ML or the LKML ?

1. at least on i386, every combination should be fixed
   only if extraordinary pathological and nonsensical cases are hard to 
   fix there might be exceptions
2. I'd send them to lkml since they are bug fixes

> re,
>  wh

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
