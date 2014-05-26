From: Yann Droneaud <ydroneaud@opteya.com>
Date: Mon, 26 May 2014 19:14:48 +0000
Subject: Re: [PATCH 1/3] driver core/platform: don't leak memory allocated for dma_mask
Message-Id: <1401131688.18997.12.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401122483-31603-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401122483-31603-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

Hi Emil,

Le lundi 26 mai 2014 à 18:41 +0200, Emil Goode a écrit :

> The first two patches in the series are created from v4 of the
> original patch, since I have not changed how the code works I think
> it is correct to keep the original author and Signed-off-by line.
> 
> Best regards,

Thanks for the update.

I wasn't interested in splitting the patch in two separate chunks,
thinking that shrinking the size of the structure then increasing it of
roughly the same amount was not the best way to sell the changes :)

Unfortunately, as noted by Uwe, you not only split the patch but also
broke it ;)

If we're going to split the patch, it should be split in:
1) replace name[1] by name[] (or name[0]) to remove the implicit padding
from platform_device structure
2) add dma_mask to platform_object structure and use it to initialize
   dev.dma_mask.

Anyway, as Russel explained in another mail, unconditionally set
dev.dma_mask pointer is probably going to break, so this part (2) need
some rework, I'm gonna try to do.

Thanks for reminding me about this patch.

Regards.

-- 
Yann Droneaud
OPTEYA


