From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 11:40:04 +0000
Subject: Re: [PATCH 1/2] kmemleak: Delete an error message for a failed memory allocation in two functions
Message-Id: <8e1d5cce-3661-44cc-ea1c-ac754513cde4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
 <986426ab-4ca9-ee56-9712-d06c25a2ed1a@users.sourceforge.net>
 <20170814111430.lskrrg3fygpnyx6v@armageddon.cambridge.arm.com>
In-Reply-To: <20170814111430.lskrrg3fygpnyx6v@armageddon.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> +++ b/mm/kmemleak.c
>> @@ -555,7 +555,6 @@ static struct kmemleak_object *create_object(unsigned long ptr, size_t size,
>>  
>>  	object = kmem_cache_alloc(object_cache, gfp_kmemleak_mask(gfp));
>>  	if (!object) {
>> -		pr_warn("Cannot allocate a kmemleak_object structure\n");
>>  		kmemleak_disable();
> 
> I don't really get what this patch is trying to achieve.

I suggest to reduce the code size a bit.


> Given that kmemleak will be disabled after this,

I have got difficulties to interpret this information.


> I'd rather know why it happened.

Do you find the default allocation failure report sufficient?

Regards,
Markus
