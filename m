From: Laura Abbott <labbott@redhat.com>
Date: Thu, 13 Oct 2016 00:12:42 +0000
Subject: Re: [patch] staging: android: ion: Fix error handling in ion_query_heaps()
Message-Id: <81184792-900c-d0a1-1a55-d8505a3a3e90@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012124940.GA23933@mwanda>
In-Reply-To: <20161012124940.GA23933@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/12/2016 05:49 AM, Dan Carpenter wrote:
> copy_to_user() returns the number of bytes remaining to be copied.  We
> want to return -EFAULT here instead.  Also there seems like no point
> in continuing the loop if copy_to_user() fails.
>
> Fixes: 02b23803c6af ('staging: android: ion: Add ioctl to query available heaps')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The error handling still might be wrong here.  Do we really want to
> change query->cnt?  Please review.
>
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 396ded5..4cec0b2 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -1187,8 +1187,10 @@ int ion_query_heaps(struct ion_client *client, struct ion_heap_query *query)
>  		hdata.type = heap->type;
>  		hdata.heap_id = heap->id;
>
> -		ret = copy_to_user(&buffer[cnt],
> -				   &hdata, sizeof(hdata));
> +		if (copy_to_user(&buffer[cnt], &hdata, sizeof(hdata))) {
> +			ret = -EFAULT;
> +			break;
> +		}
>
>  		cnt++;
>  		if (cnt >= max_cnt)
>

Yeah, I really butchered the error handling on this. You are correct,
query->cnt shouldn't be updated. break can be changed to 'goto out'.

Thanks,
Laura
