From: walter harms <wharms@bfs.de>
Date: Tue, 03 Feb 2015 08:48:01 +0000
Subject: Re: [PATCH 2/3] md/bitmap: Delete an unnecessary check before the function call "kfree"
Message-Id: <54D08B41.5010307@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54CF95CA.90102@users.sourceforge.net>
In-Reply-To: <54CF95CA.90102@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 02.02.2015 20:46, schrieb NeilBrown:
> On Mon, 02 Feb 2015 16:20:42 +0100 SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> 
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Mon, 2 Feb 2015 15:10:57 +0100
>>
>> The kfree() function tests whether its argument is NULL and then
>> returns immediately. Thus the test around the call is not needed.
>>
>> * This issue was detected by using the Coccinelle software.
>>
>> * Let us also move an assignment for the variable "pages" to the place
>>   directly before it is really needed for a loop.
>>
>> * Let us also move another kfree() call into a block which should belong
>>   to a previous check for the variable "bp".
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/md/bitmap.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
>> index da3604e..47d72df 100644
>> --- a/drivers/md/bitmap.c
>> +++ b/drivers/md/bitmap.c
>> @@ -1586,15 +1586,15 @@ static void bitmap_free(struct bitmap *bitmap)
>>  	bitmap_file_unmap(&bitmap->storage);
>>  
>>  	bp = bitmap->counts.bp;
>> -	pages = bitmap->counts.pages;
>>  
>>  	/* free all allocated memory */
>> -
>> -	if (bp) /* deallocate the page memory */
>> +	if (bp) { /* deallocate the page memory */
>> +		pages = bitmap->counts.pages;
>>  		for (k = 0; k < pages; k++)
>> -			if (bp[k].map && !bp[k].hijacked)
>> +			if (!bp[k].hijacked)
>>  				kfree(bp[k].map);
>> -	kfree(bp);
>> +		kfree(bp);
>> +	}
>>  	kfree(bitmap);
>>  }
>>  
> 
> Hi,
>  I'm somewhat amused that you removed a test for one kfree, but imposed a
>  test on another.  I realised the second test was already there, but why not
>  just:
> 
> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> index da3604e73e8a..ad13b2e1bf1f 100644
> --- a/drivers/md/bitmap.c
> +++ b/drivers/md/bitmap.c
> @@ -1592,7 +1592,7 @@ static void bitmap_free(struct bitmap *bitmap)
>  
>  	if (bp) /* deallocate the page memory */
>  		for (k = 0; k < pages; k++)
> -			if (bp[k].map && !bp[k].hijacked)
> +			if (!bp[k].hijacked)
>  				kfree(bp[k].map);
>  	kfree(bp);
>  	kfree(bitmap);
> 
> 
> It makes the intention of the patch much clearer.
> 
> I'd probably prefer to leave the code as it is.  I don't think either patch
> is really an improvement in readability, and readability trumps performance
> in places like this.
> 


hello Neil,
just for my curiosity.
is it possible that a bp[k] exists but bp[k].hijacked is 0 ?
if that case: kfree(bp) would free an object in use.
otherwise hijacked seems useless here as it is possible to free
everything.

re,
 wh
