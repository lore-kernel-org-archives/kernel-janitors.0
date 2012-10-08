From: Tony Lindgren <tony@atomide.com>
Date: Mon, 08 Oct 2012 21:19:50 +0000
Subject: Re: [PATCH] arch/arm/mach-omap2: Remove unecessary semicolon
Message-Id: <20121008211949.GL13011@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347986174-30287-1-git-send-email-peter.senna@gmail.com>
 <1347986174-30287-4-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347986174-30287-4-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

* Peter Senna Tschudin <peter.senna@gmail.com> [120918 09:37]:
> Found by http://coccinelle.lip6.fr/
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
>  arch/arm/mach-omap2/board-flash.c          | 2 +-
>  arch/arm/mach-omap2/clkt_clksel.c          | 2 +-
>  arch/arm/mach-omap2/mux.c                  | 2 +-
>  arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 6 +++---
>  arch/arm/mach-omap2/pm-debug.c             | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

Thanks applying into omap fixes branch.

Regards,

Tony 

