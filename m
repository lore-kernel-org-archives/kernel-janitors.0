From: Tomas Winkler <tomas.winkler@intel.com>
Date: Sun, 19 Aug 2012 12:37:29 +0000
Subject: Re: [patch] staging: ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <CA+i0qc6YmaCdX_ZYrkBq27gWYVNijNzNJP2aYnNBa9bnnVhRmQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120818084759.GB30592@elgon.mountain>
In-Reply-To: <20120818084759.GB30592@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> On 18/08/12 09:47, Dan Carpenter wrote:
>>
>> "addr" is a pointer so it's either 4 or 8 bytes, but actually we want
>> to compare 6 bytes (ETH_ALEN).
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
>
> Acked-by: Rupesh Gujare<rgujare@ozmodevices.com>

why not to use 'if (is_zero_ether_addr())" from linux/etherdevice.h
Thanks
Tomas


>
>
>
>> diff --git a/drivers/staging/ozwpan/ozcdev.c
>> b/drivers/staging/ozwpan/ozcdev.c
>> index d983219..63c1b67 100644
>> --- a/drivers/staging/ozwpan/ozcdev.c
>> +++ b/drivers/staging/ozwpan/ozcdev.c
>> @@ -213,7 +213,7 @@ static int oz_set_active_pd(u8 *addr)
>>                 if (old_pd)
>>                         oz_pd_put(old_pd);
>>         } else {
>> -               if (!memcmp(addr, "\0\0\0\0\0\0", sizeof(addr))) {
>> +               if (!memcmp(addr, "\0\0\0\0\0\0", ETH_ALEN)) {
>>                         spin_lock_bh(&g_cdev.lock);
>>                         pd = g_cdev.active_pd;
>>                         g_cdev.active_pd = 0;
>>
>
>
> --
> Regards,
> Rupesh Gujare
>
>
>
> _______________________________________________
> devel mailing list
> devel@linuxdriverproject.org
> http://driverdev.linuxdriverproject.org/mailman/listinfo/devel
