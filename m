From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 06 Jul 2019 20:13:46 +0000
Subject: Re: [PATCH] ipc/sem: Three function calls less in do_semtimedop()
Message-Id: <3c5d5941-63bf-5576-e6eb-17ca02a6a8a3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ba328a83-63ac-c3a3-cbc0-81059012c555@web.de>
In-Reply-To: <ba328a83-63ac-c3a3-cbc0-81059012c555@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Davidlohr Bueso <dave@stgolabs.net>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Manfred Spraul <manfred@colorfullife.com>, Mathieu Malaterre <malat@debian.org>
Cc: LKML <linux-kernel@vger.kernel.org>

On 06/07/2019 13:28, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jul 2019 14:16:24 +0200
> 
> Avoid three function calls by using ternary operators instead of
> conditional statements.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  ipc/sem.c | 25 ++++++++-----------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/ipc/sem.c b/ipc/sem.c
> index 7da4504bcc7c..56ea549ac270 100644
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@ -2122,27 +2122,18 @@ static long do_semtimedop(int semid, struct sembuf __user *tsops,
>  		int idx = array_index_nospec(sops->sem_num, sma->sem_nsems);
>  		curr = &sma->sems[idx];
> 
> -		if (alter) {
> -			if (sma->complex_count) {
> -				list_add_tail(&queue.list,
> -						&sma->pending_alter);
> -			} else {
> -
> -				list_add_tail(&queue.list,
> -						&curr->pending_alter);
> -			}
> -		} else {
> -			list_add_tail(&queue.list, &curr->pending_const);
> -		}
> +		list_add_tail(&queue.list,
> +			      alter
> +			      ? (sma->complex_count
> +				? &sma->pending_alter
> +				: &curr->pending_alter)
> +			      : &curr->pending_const);

Just no. This is making the code harder to comprehend with no advantage.
Compilers are smart, let the do the optimization work and keep code
simple for us mere mortals.

Colin

>  	} else {
>  		if (!sma->complex_count)
>  			merge_queues(sma);
> 
> -		if (alter)
> -			list_add_tail(&queue.list, &sma->pending_alter);
> -		else
> -			list_add_tail(&queue.list, &sma->pending_const);
> -
> +		list_add_tail(&queue.list,
> +			      alter ? &sma->pending_alter : &sma->pending_const);
>  		sma->complex_count++;
>  	}
> 
> --
> 2.22.0
> 
