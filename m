From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 14:12:10 +0000
Subject: Re: [PATCH 20/56] inflate: Remove void casts
Message-Id: <49DCB0BA.70606@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>	 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>	 <36ca99e90904080439u7098d2feka5dd39f8ab6a470c@mail.gmail.com>	 <49DCAC88.7010500@fastmail.fm> <87a5b0800904080705n74829b75l8becfd6e7d1a321f@mail.gmail.com>
In-Reply-To: <87a5b0800904080705n74829b75l8becfd6e7d1a321f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Newton <will.newton@gmail.com>
Cc: Bert Wesarg <bert.wesarg@googlemail.com>, linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

Will Newton wrote:
> On Wed, Apr 8, 2009 at 2:54 PM, Jack Stone <jwjstone@fastmail.fm> wrote:
>   
>>  lib/inflate.c |    5 ++---
>>  1 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/inflate.c b/lib/inflate.c
>> index 1a8e8a9..1eb0cd8 100644
>> --- a/lib/inflate.c
>> +++ b/lib/inflate.c
>> @@ -249,7 +249,7 @@ static void *malloc(int size)
>>
>>        malloc_ptr = (malloc_ptr + 3) & ~3;     /* Align */
>>
>> -       p = (void *)malloc_ptr;
>> +       p = malloc_ptr;
>>        malloc_ptr += size;
>>     
>
> Won't this cause a "assignment makes pointer from integer without a
> cast" warning?
I don't think so. The cast had no effect as both malloc_ptr and p are
declared as void *. The later += size
does pointer arithmetic.

Thanks,

Jack
