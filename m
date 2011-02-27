From: Oliver Endriss <o.endriss@gmx.de>
Date: Sun, 27 Feb 2011 14:36:17 +0000
Subject: Re: [patch v2] [media] stv090x: handle allocation failures
Message-Id: <201102271536.18905@orion.escape-edv.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110207165650.GF4384@bicker> <201102150300.19650@orion.escape-edv.de> <20110215101008.GO4384@bicker>
In-Reply-To: <20110215101008.GO4384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Manu Abraham <manu@linuxtv.org>, Andreas Regel <andreas.regel@gmx.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tuesday 15 February 2011 11:10:08 Dan Carpenter wrote:
> kmalloc() can fail so check whether state->internal is NULL.
> append_internal() can return NULL on allocation failures so check that.
> Also if we hit the error condition later in the function then there is
> a memory leak and we need to call remove_dev() to fix it.
> 
> Also Oliver Endriss pointed out an additional leak that I missed in the
> first version of this patch.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2:  Fix the leak Oliver noticed.
> 
> diff --git a/drivers/media/dvb/frontends/stv090x.c b/drivers/media/dvb/frontends/stv090x.c
> ...

Acked-by: Oliver Endriss <o.endriss@gmx.de>

CU
Oliver

-- 
----------------------------------------------------------------
VDR Remote Plugin 0.4.0: http://www.escape-edv.de/endriss/vdr/
4 MByte Mod: http://www.escape-edv.de/endriss/dvb-mem-mod/
Full-TS Mod: http://www.escape-edv.de/endriss/dvb-full-ts-mod/
----------------------------------------------------------------
