From: mathieu souchaud <mattieu.souchaud@free.fr>
Date: Fri, 25 Apr 2014 11:53:35 +0000
Subject: Re: [PATCH] x86/mce: Check misc_register() return code.
Message-Id: <535A4CBF.1090301@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1398419295-18590-1-git-send-email-mattieu.souchaud@free.fr> <20140425104256.GB18540@nazgul.tnic>
In-Reply-To: <20140425104256.GB18540@nazgul.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Great,

I will fix that soon.

Thanks.

Le 25/04/2014 12:42, Borislav Petkov a =C3=A9crit :
> On Fri, Apr 25, 2014 at 11:48:15AM +0200, Mathieu Souchaud wrote:
>> The current code does not check the return from misc_register() so set
>> the return variable with the return code of misc_register.
>>
>> Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
>> ---
>>   arch/x86/kernel/cpu/mcheck/mce.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mche=
ck/mce.c
>> index 68317c8..45fb7aa 100644
>> --- a/arch/x86/kernel/cpu/mcheck/mce.c
>> +++ b/arch/x86/kernel/cpu/mcheck/mce.c
>> @@ -2462,7 +2462,7 @@ static __init int mcheck_init_device(void)
>>   	cpu_notifier_register_done();
>>  =20
>>   	/* register character device /dev/mcelog */
>> -	misc_register(&mce_chrdev_device);
>> +	err =3D misc_register(&mce_chrdev_device);
> This function mcheck_init_device() is a one big sloppy mess
> of not handling the error cases responsibly. It doesn't check
> zalloc_cpumask_var() retval, it doesn't free the mce_device_initialized
> when subsys_system_register() fails, the same when mce_device_create
> fails, the same with __register_hotcpu_notifier and finally with
> misc_register.
>
> Would you be willing to fix this properly with goto labels and proper
> unwinding, like it is done in other, saner places in the kernel, and
> at the end maybe add a printk for the error case warning us that
> /dev/mcelog didn't get registered?
>
> That would be a very nice cleanup! :-)
>
> Thanks.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
