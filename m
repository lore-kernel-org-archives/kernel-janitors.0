From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2015 14:07:39 +0000
Subject: Re: [PATCH 6/8] staging : wilc1000 : remove WILC_Sint16
Message-Id: <20150604140739.GJ28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433307058-30757-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1433307058-30757-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Your subjects have too many spaces.

On Wed, Jun 03, 2015 at 01:50:58PM +0900, chaehyun lim wrote:
> Use s16 in stead of WILC_Sint16.
> 
> Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
> ---
>  drivers/staging/wilc1000/coreconfigurator.c | 2 +-
>  drivers/staging/wilc1000/wilc_oswrapper.h   | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
> index 50d184c..a060172 100644
> --- a/drivers/staging/wilc1000/coreconfigurator.c
> +++ b/drivers/staging/wilc1000/coreconfigurator.c
> @@ -173,7 +173,7 @@ static tstrConfigPktInfo gstrConfigPktInfo;
>  
>  static u8 g_seqno;
>  
> -static WILC_Sint16 g_wid_num          = -1;
> +static s16 g_wid_num          = -1;

g_wid_num is never set to anything besides -1.

TODO-list: wilc1000: get rid of g_wid_num

regards,
dan carpenter

