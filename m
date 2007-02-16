From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 16 Feb 2007 17:21:31 +0000
Subject: Re: [KJ] how do config options disappear from the "defconfig" files?
Message-Id: <20070216172131.GP13958@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702160939220.29917@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 16, 2007 at 09:40:46AM -0500, Robert P. J. Day wrote:
> 
>   i just want to clarify one point about all of the defconfig files in
> the source tree.  if a CONFIG option is removed from the Kconfig
> infrastructure, does that corresponding entry eventually disappear
> from all of the defconfig files based on an automatic build at some
> point?  thanks.

Not automatically.

Architecture maintainers sometimes [1] update the defconfig files for 
their architectures.

But don't bother - a dead option in a defconfig file doesn't do any 
harm, and manually removing options from defconfig files only causes 
never ending patch conflicts.

> rday

cu
Adrian

[1] in practice, some do it often and some never

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
