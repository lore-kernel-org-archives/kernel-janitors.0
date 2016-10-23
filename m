From: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Date: Sun, 23 Oct 2016 11:58:47 +0000
Subject: Re: [PATCH 4/4] AVR32-pio: Replace two seq_printf() calls by seq_puts() in pio_bank_show()
Message-Id: <20161023115847.GA28552@samfundet.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c76c4e36-3e5d-3106-69b7-907133c8b7d0@users.sourceforge.net>
 <87a03775-1025-8efe-3fd6-7b52491896b2@users.sourceforge.net>
In-Reply-To: <87a03775-1025-8efe-3fd6-7b52491896b2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Around Sun 16 Oct 2016 22:36:24 +0200 or thereabout, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 16 Oct 2016 22:18:31 +0200
> 
> Strings which did not contain data format specifications should be put
> into a sequence. Thus use the corresponding function "seq_puts".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This series of four patches look good to me, I will append them to for-linus
and push them for next merge window.

Thanks.

Acked-by: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>

> ---
>  arch/avr32/mach-at32ap/pio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

<snipp diff>

-- 
mvh
Hans-Christian Noren Egtvedt
