From: Greg Dietsche <gregory.dietsche@cuw.edu>
Date: Wed, 20 Jul 2011 02:03:57 +0000
Subject: Re: [PATCH] frv: remove unnecessary code
Message-Id: <4E26378D.9090500@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242660-29054-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242660-29054-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/09/2011 10:29 AM, Greg Dietsche wrote:
> On Thu, Jun 16, 2011 at 11:44:20AM -0500, Greg Dietsche wrote:
>    
>> remove unnecessary code that matches this coccinelle pattern
>> 	if (...)
>> 		return ret;
>> 	return ret;
>>
>> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
>> ---
>>   arch/frv/mm/pgalloc.c |    8 +-------
>>   1 files changed, 1 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/frv/mm/pgalloc.c b/arch/frv/mm/pgalloc.c
>> index c42c83d..4fb63a3 100644
>> --- a/arch/frv/mm/pgalloc.c
>> +++ b/arch/frv/mm/pgalloc.c
>> @@ -133,13 +133,7 @@ void pgd_dtor(void *pgd)
>>
>>   pgd_t *pgd_alloc(struct mm_struct *mm)
>>   {
>> -	pgd_t *pgd;
>> -
>> -	pgd = quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
>> -	if (!pgd)
>> -		return pgd;
>> -
>> -	return pgd;
>> +	return quicklist_alloc(0, GFP_KERNEL, pgd_ctor);
>>   }
>>
>>   void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>> -- 
>> 1.7.2.5
>>
>> --
>>      
> Any feedback on this patch?
>
> Thanks!
> Greg
>
>    
adding trivial@kernel.org to the cc list since this is trivial and no 
one has picked up this patch to date.

Greg
