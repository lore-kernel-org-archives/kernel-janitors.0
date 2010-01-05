From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 05 Jan 2010 10:32:20 +0000
Subject: Re: [PATCH 03/10] isdn/mISDN: add __init/__exit macros to
Message-Id: <alpine.LNX.2.00.1001051132070.2277@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200912220941.42370.PeterHuewe@gmx.de>
In-Reply-To: <200912220941.42370.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, Andreas Eversberg <andreas@eversberg.eu>, "David S. Miller" <davem@davemloft.net>

On Tue, 22 Dec 2009, Peter Huewe wrote:

> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  drivers/isdn/mISDN/dsp_core.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
> index 43ff4d3..6eac588 100644
> --- a/drivers/isdn/mISDN/dsp_core.c
> +++ b/drivers/isdn/mISDN/dsp_core.c
> @@ -1114,7 +1114,7 @@ static struct Bprotocol DSP = {
>  	.create = dspcreate
>  };
>  
> -static int dsp_init(void)
> +static int __init dsp_init(void)
>  {
>  	int err;
>  	int tics;
> @@ -1212,7 +1212,7 @@ static int dsp_init(void)
>  }
>  
>  
> -static void dsp_cleanup(void)
> +static void __exit dsp_cleanup(void)
>  {
>  	mISDN_unregister_Bprotocol(&DSP);

Applied, thanks Peter.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
