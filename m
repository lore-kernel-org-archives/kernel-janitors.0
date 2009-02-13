From: Jiri Slaby <jirislaby@gmail.com>
Date: Fri, 13 Feb 2009 10:05:58 +0000
Subject: Re: [PATCH] drivers/isdn/hardware/mISDN: fix sparse warnings: make
Message-Id: <49954606.9080204@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090212192810.7401.70271.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090212192810.7401.70271.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/12/2009 08:28 PM, Hannes Eder wrote:
> diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
> index f0e14df..2bb85c4 100644
> --- a/drivers/isdn/hardware/mISDN/hfcpci.c
> +++ b/drivers/isdn/hardware/mISDN/hfcpci.c
> @@ -56,8 +56,8 @@ static const char *hfcpci_revision = "2.0";
>  static int HFC_cnt;
>  static uint debug;
>  static uint poll, tics;
> -struct timer_list hfc_tl;
> -u32	hfc_jiffies;
> +static struct timer_list hfc_tl;
> +static u32 hfc_jiffies;

Please also fix the hfc_jiffies type (ulong). (As a separate patch.)
