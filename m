From: Oleg Drokin <green@linuxhacker.ru>
Date: Sun, 03 May 2015 19:14:58 +0000
Subject: Re: [PATCH] staging/lustre: Always try kmalloc first for OBD_ALLOC_LARGE
Message-Id: <C70957A8-1B32-4D1B-8435-27DF15489D40@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430625501-1069-1-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello!

On May 3, 2015, at 2:31 PM, Greg KH wrote:

>> -/* Allocations above this size are considered too big and could not be done
>> - * atomically.
>> - *
>> - * Be very careful when changing this value, especially when decreasing it,
>> - * since vmalloc in Linux doesn't perform well on multi-cores system, calling
>> - * vmalloc in critical path would hurt performance badly. See LU-66.
>> - */
>> -#define OBD_ALLOC_BIG (4 * PAGE_CACHE_SIZE)
>> -
>> #define OBD_ALLOC_LARGE(ptr, size)					    \
>> do {									  \
>> -	if (size > OBD_ALLOC_BIG)					     \
>> -		OBD_VMALLOC(ptr, size);				       \
>> -	else								  \
>> -		OBD_ALLOC(ptr, size);					 \
>> +	ptr = libcfs_kvzalloc(size, GFP_NOFS);				  \
>> } while (0)
> 
> Just fix up all callers of these functions, if there are any anymore.

This is what Julia is doing. I am providing the stub for her wonderful scripts to unwrap per her request.

>> + */
>> +/*
>> + * Copyright (c) 2015, Oleg Drokin <green@linuxhacker.ru>
> 
> I think your employer would like a different line here...

Only on stuff that I do at work when I am getting paid.

Stuff that I do on my own uncompensated, I own all the rights to, I hope.

Bye,
    Oleg