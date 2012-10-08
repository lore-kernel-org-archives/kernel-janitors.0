From: Antti Palosaari <crope@iki.fi>
Date: Mon, 08 Oct 2012 07:04:39 +0000
Subject: Re: [samsung:v4l-framedesc 60/235] fc2580.c:(.text+0xeb49af): undefined reference to `__umoddi3'
Message-Id: <50727B07.2040609@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121007010712.GA7808@localhost>
In-Reply-To: <20121007010712.GA7808@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, linux-media <linux-media@vger.kernel.org>

On 10/07/2012 04:07 AM, Fengguang Wu wrote:
> Hi Antti,
>
> FYI, kernel build failed on
>
> tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-framedesc
> head:   fc4382b505966b2574c985588ac23825dd639e29
> commit: 384df49a6a97d411af33da3237558411789b67c5 [60/235] [media] rtl28xxu: add support for FCI FC2580 silicon tuner driver
> config: i386-allyesconfig
>
> The problematic code should be introduced by the preceding commit:
>
> d9cb41afbf2aab54133c804009a1b8e76cedaef3 [media] tuners: add FCI FC2580 silicon tuner driver
>
> All error/warnings:
>
> drivers/built-in.o: In function `fc2580_set_params':
> fc2580.c:(.text+0xeb49af): undefined reference to `__umoddi3'
> fc2580.c:(.text+0xeb4a28): undefined reference to `__udivdi3'
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
>

Hello Fengguang,

That is already fixed.

commit 9dc72160d13c6fdeec57f5c6017588812c4294b6
Author: Gianluca Gennari <gennarone@gmail.com>
Date:   Mon Sep 24 07:37:18 2012 -0300

     [media] fc2580: use macro for 64 bit division and reminder

     Fixes the following warnings on a 32 bit system with GCC 4.4.3 and 
kernel Ubuntu 2.6.32-43 32 bit:
     WARNING: "__udivdi3" [fc2580.ko] undefined!
     WARNING: "__umoddi3" [fc2580.ko] undefined!

     Signed-off-by: Gianluca Gennari <gennarone@gmail.com>
     Reviewed-by: Antti Palosaari <crope@iki.fi>
     Signed-off-by: Antti Palosaari <crope@iki.fi>
     Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>


regards
Antti

-- 
http://palosaari.fi/
