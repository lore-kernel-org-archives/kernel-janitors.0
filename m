From: Adrian Bunk <bunk@kernel.org>
Date: Fri, 18 Apr 2008 16:18:14 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080418161814.GA9770@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 14, 2008 at 02:17:50PM -0600, Matthew Wilcox wrote:
>...
> include/asm-frv/system.h:     cli();                                  \

I'll send a patch for this one (it's in an unused macro).

>...
> I also note that there's a xircom_cb that appears to be replacing
> xircom_tulip_cb, so maybe deleting xircom_tulip_cb is possible?
>...

I beat you by 3 months.  ;)

Patch is in the net tree and should go into Linus' tree within the next
two weeks.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

