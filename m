From: Ursula Braun <ubraun@linux.ibm.com>
Date: Thu, 12 Sep 2019 07:19:07 +0000
Subject: Re: [PATCH] s390/qeth: fix spelling mistake "alocpool" -> "allocpool"
Message-Id: <de37e3a5-faad-44ae-32b2-d7c6c5d3732d@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911153500.30836-1-colin.king@canonical.com>
In-Reply-To: <20190911153500.30836-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-s390@vger.kernel.org
Cc: Julian Wiedmann <jwi@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>



On 9/11/19 5:35 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in QETH_CARD_TEXT text. Fix it.
> 

This spelling mistake is intended, because this qeth trace area is defined for
8 byte length entries. We try to make the entries as speaking as possible - even
at cost of spelling mistakes.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/s390/net/qeth_core_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
> index a7868c8133ee..ab96b22db3fe 100644
> --- a/drivers/s390/net/qeth_core_main.c
> +++ b/drivers/s390/net/qeth_core_main.c
> @@ -218,7 +218,7 @@ static int qeth_alloc_buffer_pool(struct qeth_card *card)
>  	void *ptr;
>  	int i, j;
>  
> -	QETH_CARD_TEXT(card, 5, "alocpool");
> +	QETH_CARD_TEXT(card, 5, "allocpool");
>  	for (i = 0; i < card->qdio.init_pool.buf_count; ++i) {
>  		pool_entry = kzalloc(sizeof(*pool_entry), GFP_KERNEL);
>  		if (!pool_entry) {
> 
