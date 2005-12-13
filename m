From: Jesse Millan <jessem@cs.pdx.edu>
Date: Tue, 13 Dec 2005 16:52:40 +0000
Subject: Re: [KJ] [PATCH] dm: uninitialize static variables
Message-Id: <8351D214-05D7-4B3D-B62F-6BA05D454810@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90650230319097691=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051205132800.34631bbf@lucky.kitzblitz>
In-Reply-To: <20051205132800.34631bbf@lucky.kitzblitz>
To: kernel-janitors@vger.kernel.org

--===============90650230319097691==
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Dec 11, 2005, at 11:17 PM, Jaco Kroon wrote:

>
> In reply to Nicolas Kaiser
>> * "Carlos Manuel Duclos Vergara" <carlos@embedded.cl>:
>>>> uninitialize static variables initialized to 0, to make them go
>>>> to .bss instead of .data.
>>>>
>>>
>>> if you want that why not explicitely put them in .bss?
>>> something like:
>>>
>>>> -static unsigned int major = 0;
>>>> +static unsigned int major; /* = 0 */
>>>
>>> static unsigned int major = 0 __attribute__ ((section(".bss"));
>>
>> I personally like the idea of explicitly expressing this intention,
>> but I didn't manage to achieve this together with initialization.
>> I tried
>
>> From http://janitor.kernelnewbies.org/TODO:
>
> - uninitialize static variables initialized to 0, to make it go to  
> the .bss,
>   instead of .data.
>   __initdata inside functions has to be initialized, even if to 0  
> though.
>
> Therefor I would go with
>
> static unsigned int major; /* = 0 */
>
> Let the compiler make the decision, it will make the correct one.  The
> comment is just there to indicate that we haven't forgotten to  
> initialise
> it.  As soon as you explicitly initialise you force the compiler to  
> place
> it somewhere other than bss.
>

The comment only indicates that you purposely did not initialize the  
variable. However, it does not indicate *why* you chose to do so like  
the section attribute would. What about:

static unsigned int major; /* __attribute__ ((section(".bss")) */

or

static unsigned int major; /* section(".bss") */

which is more explicit about your intentions, lets the compiler  
ultimately choose, and is not tied to gcc.


>
> -- 
> There are 10 kinds of people in the world, those who understand  
> binary,
> and those who don't.
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

--
Jesse Millan
CNS Unix/Windows Team
Portland State University
Phone: (503) 725-3285
Homepage: www.system-calls.com

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc



--===============90650230319097691==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90650230319097691==--
