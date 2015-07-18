From: Sohny Thomas <sohnythomas@zoho.com>
Date: Sat, 18 Jul 2015 08:48:07 +0000
Subject: Re: [PATCH v3 ] Staging: Android: Fixes for TODO file
Message-Id: <55AA0FF7.1000103@zoho.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55940BF7.8020104@zoho.com>
In-Reply-To: <55940BF7.8020104@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Wednesday 15 July 2015 04:20 AM, Greg KH wrote:
> On Wed, Jul 01, 2015 at 09:19:11PM +0530, Sohny Thomas wrote:
>> Removed non-existent issue from TODO file
>> No instance of kuid_t or uid_t as mentioned by the file is present in staging/android directory
>>
>> Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
>> ---
>>  drivers/staging/android/TODO | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/staging/android/TODO b/drivers/staging/android/TODO
>> index 06954cd..b15fb0d 100644
>> --- a/drivers/staging/android/TODO
>> +++ b/drivers/staging/android/TODO
>> @@ -5,13 +5,6 @@ TODO:
>>         - make sure things build as modules properly
>>         - add proper arch dependencies as needed
>>         - audit userspace interfaces to make sure they are sane
>> -       - kuid_t should never be exposed to user space as it is
>> -          kernel internal type. Data structure for this kuid_t is:
>> -          typedef struct {
>> -               uid_t val;
>> -          } kuid_t;
>> -       - This bug is introduced by Xiong Zhou in the patch bd471258f2e09
>> -       - ("staging: android: logger: use kuid_t instead of uid_t")
>>
>>  Please send patches to Greg Kroah-Hartman <greg@kroah.com> and Cc:
>>  Brian Swetland <swetland@google.com>
> 
> Doesn't apply to the tree :(
Uh, Sorry to reply late, you mean this snippet is not part of the tree?
> 

