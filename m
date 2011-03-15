From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 15 Mar 2011 19:19:23 +0000
Subject: Re: [PATCH] powerpc: sysdev: fix signedness bug
Message-Id: <EA2A84CF-6A11-4CEC-B4FD-96F1262ED9AF@kernel.crashing.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287327102-9068-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1287327102-9068-1-git-send-email-segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Vivek Mahajan <vivek.mahajan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>


On Oct 17, 2010, at 9:51 AM, Vasiliy Kulikov wrote:

> sram_params.sram_size and sram_params.sram_offset were unsigned.
> If get_cache_sram_size() or get_cache_sram_offset() returns error code
> then it is not seen to the caller.  Made sram_size and sram_offset signed.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
> arch/powerpc/sysdev/fsl_85xx_l2ctlr.c |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)

applied

- k
