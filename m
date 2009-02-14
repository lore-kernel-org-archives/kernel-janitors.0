From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 14 Feb 2009 22:48:58 +0000
Subject: Re: [PATCH] drivers/isdn/hardware/mISDN: change type of hfc_jiffies
Message-Id: <49974A5A.9030109@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214224049.28194.38982.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214224049.28194.38982.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> Patch suggested by Jiri Slaby.

Well, at least some log needed.

jiffies are ulong, make sure we fit in jiffies store variable on archs with
bits per long > 32.

> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> 
> This patch is based on:
>     drivers/isdn/hardware/mISDN: fix sparse warnings: make symbols static
> 
>  drivers/isdn/hardware/mISDN/hfcpci.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
> index 2bb85c4..c7a855c 100644
> --- a/drivers/isdn/hardware/mISDN/hfcpci.c
> +++ b/drivers/isdn/hardware/mISDN/hfcpci.c
> @@ -57,7 +57,7 @@ static int HFC_cnt;
>  static uint debug;
>  static uint poll, tics;
>  static struct timer_list hfc_tl;
> -static u32 hfc_jiffies;
> +static ulong hfc_jiffies;

Ok, unsigned long would be nicer. I though it would be implicit when writing
about ulong, but I see not in this uint-et-al context...
