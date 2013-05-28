From: Chen Gang <gang.chen@asianux.com>
Date: Tue, 28 May 2013 05:12:30 +0000
Subject: Re: [PATCH v2] arch: s390: appldata: using strncpy() and strnlen() instead of sprintf()
Message-Id: <51A43CBE.40808@asianux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A32D81.2010105@asianux.com>
In-Reply-To: <51A32D81.2010105@asianux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/28/2013 12:53 AM, walter harms wrote:
> Am 27.05.2013 11:55, schrieb Chen Gang:
>> diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
>> index bae0f40..87a2209 100644
>> --- a/arch/s390/appldata/appldata_base.c
>> +++ b/arch/s390/appldata/appldata_base.c
>> @@ -212,7 +212,9 @@ appldata_timer_handler(ctl_table *ctl, int write,
>>  		return 0;
>>  	}
>>  	if (!write) {
>> -		len = sprintf(buf, appldata_timer_active ? "1\n" : "0\n");
>> +		strncpy(buf, appldata_timer_active ? "1\n" : "0\n",
>> +			ARRAY_SIZE(buf));
> 
> an other way would be
> 
> buf[]="0\n";
> if (appldata_timer_active) buf[0]='1';
> 
> 
>> +		len = strnlen(buf, ARRAY_SIZE(buf));
> 
> can len ever change ?
> 

I do not know whether it will be changed, but we need treat it that it
may be changed in the future.

I guess it uses "?\n" as a protocol between kernel mode and user mode.
This patch fix the 'protocol' transferring issue independent of the
'protocol' itself.

In the future, the 'protocol' updates to new version (e.g. append
additional characters, which will still compitable with the original
version), what this patch have done will be still effective.


Thanks.
-- 
Chen Gang

Asianux Corporation
