From: Paul Fulghum <paulkf@microgate.com>
Date: Tue, 29 Jun 2010 18:09:10 +0000
Subject: Re: [PATCH 02/16] trivial: use ARRAY_SIZE
Message-Id: <4C2A36C6.3020101@microgate.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726089-24467-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277726089-24467-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: trivial@kernel.org, Kernel Janitors <kernel-janitors@vger.kernel.org>, Stephen Hemminger <shemminger@vyatta.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

On 6/28/2010 5:54 AM, Kulikov Vasiliy wrote:
> Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/char/synclink_gt.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/char/synclink_gt.c b/drivers/char/synclink_gt.c
> index 4561ce2..334cf5c 100644
> --- a/drivers/char/synclink_gt.c
> +++ b/drivers/char/synclink_gt.c
> @@ -4845,7 +4845,7 @@ static int register_test(struct slgt_info *info)
>  {
>  	static unsigned short patterns[] >  		{0x0000, 0xffff, 0xaaaa, 0x5555, 0x6969, 0x9696};
> -	static unsigned int count = sizeof(patterns)/sizeof(patterns[0]);
> +	static unsigned int count = ARRAY_SIZE(patterns);
>  	unsigned int i;
>  	int rc = 0;
>  

Acked-by: Paul Fulghum <paulkf@microgate.com>

with the exception of the trailing CR :-)

-- 
Paul Fulghum
MicroGate Systems, Ltd.
