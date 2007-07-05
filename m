From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 05 Jul 2007 20:13:29 +0000
Subject: Re: [KJ] OSS versus ALSA parts of the tree?
Message-Id: <20070705201329.GQ3492@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0707051453570.18394@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0707051453570.18394@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 05, 2007 at 02:55:49PM -0400, Robert P. J. Day wrote:
> 
>   perhaps a dumb question but where's the dividing line between the
> OSS and ALSA portions of the source tree?  within the sound/
> directory, i can see the oss/ subdirectory, but is that all that
> constitutes OSS?
>...

Yes, sound/oss/ is all (sound/sound_firmware.c is only built for OSS, 
but it's more because OSS is the only remaining user).

> rday

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
