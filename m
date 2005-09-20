From: Jesse Millan <jesse.millan@gmail.com>
Date: Tue, 20 Sep 2005 21:10:11 +0000
Subject: Re: [KJ] [PATCH] specialix: eliminate deprecated check_region() call
Message-Id: <34BD1896-CCC5-4715-AE5E-87AFD1178EBB@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86854130643800476=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
In-Reply-To: <25465C7B-EEA6-4184-869C-A43AB6079D2F@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============86854130643800476==
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Sep 20, 2005, at 2:04 PM, Alexey Dobriyan wrote:

> On Tue, Sep 20, 2005 at 12:29:48PM -0700, Jesse Millan wrote:
>
>> Eliminate deprecated call to check_region(). Call is replaced with
>> request_region().
>>
>
>
>> --- linux-2.6.14-rc1/drivers/char/specialix.c
>> +++ linux-2.6.14-rc1-jessem/drivers/char/specialix.c
>>
>
>
>>  static inline int sx_check_io_range(struct specialix_board * bp)
>>  {
>> -    return check_region (bp->base, SX_IO_SPACE);
>> +    if(!request_region(bp->base, SX_IO_SPACE, "specialix IO8+")) {
>> +        /* region busy */
>> +        return 1;
>> +    }
>> +    else {
>> +        return 0;
>> +    }
>>  }
>>
>
> * request_region() requires release_region() on all exit paths.
> * You've changed function that "checks" to function that  
> "requests", so
>   you have to release_region() on all exit paths after
>   sx_check_io_range().
> * After fixing previous (*), name "sx_check_io_range" is still
>   misleading. Now it requests, not checks!
> * Changing name to sx_request_io_range() doesn't work because the  
> driver
>   already have one. ;-) BTW, request_region() in it is unchecked  
> probably
>   due to "if check_region() said OK, request_region() can't fail".
>
> So, simple renaming is almost certainly wrong.
>
>

Thanks Alexey!

I'll brush myself off and try again :-)

--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc



--===============86854130643800476==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86854130643800476==--
