From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Date: Wed, 18 Jan 2017 15:12:17 +0000
Subject: Re: [PATCH 0/3] AVR32: Fine-tuning for two function implementations
Message-Id: <20170118151217.GA26808@samfundet.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
In-Reply-To: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Around Wed 18 Jan 2017 14:45:07 +0100 or thereabout, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 14:40:04 +0100
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Return directly after a failed access_ok() in setup_rt_frame()
>   Delete an unnecessary variable initialisation in setup_rt_frame()
>   Return an error code only as a constant in sys_cacheflush()
> 
>  arch/avr32/kernel/signal.c |  5 ++---
>  arch/avr32/mm/cache.c      | 21 +++++----------------
>  2 files changed, 7 insertions(+), 19 deletions(-)

Ack, I guess it slightly simplifies reading. Will add to linux-avr32 git
tree.

-- 
mvh
Hans-Christian Noren Egtvedt
