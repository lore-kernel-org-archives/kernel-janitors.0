From: Jesse Millan <jesse.millan@gmail.com>
Date: Tue, 27 Sep 2005 01:17:23 +0000
Subject: Re: [KJ] [PATCH][RESEND] BusLogic: eliminate deprecated
Message-Id: <B0022A7C-236E-44F3-911C-9D3C6EF111D3@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6800045129627299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70805EB9-1C7E-4413-B2DC-1D53C88B1BA7@gmail.com>
In-Reply-To: <70805EB9-1C7E-4413-B2DC-1D53C88B1BA7@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============6800045129627299==
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Sep 25, 2005, at 1:44 AM, Alexey Dobriyan wrote:

> On Sat, Sep 24, 2005 at 07:13:15PM -0700, Jesse Millan wrote:
>
>> This patch eliminates the deprecated calls to check_region(). It's
>> replaced with request_region(). New version is  a little more wordy
>> due to the fact that requst_region() cannot be easily compacted into
>> the ? operator.
>>
>
> I _was_ low on coffee:
>
>
>> -    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
>> BusLogic_ProbeOptions.Probe330 : check_region(0x330,  
>> BusLogic_MultiMasterAddressCount) == 0)
>> -        BusLogic_AppendProbeAddressISA(0x330);
>> +    if(BusLogic_ProbeOptions.LimitedProbeISA) {
>> +        if(BusLogic_ProbeOptions.Probe330)
>> +            BusLogic_AppendProbeAddressISA(0x330);
>> +    } else {
>> +        if(request_region(0x330,  
>> BusLogic_MultiMasterAddressCount, "BusLogic")) {
>> +            release_region(0x330, BusLogic_MultiMasterAddressCount)
>> +            BusLogic_AppendProbeAddressISA(0x330);
>> +        }
>> +    }
>>
>
> You removed check_region(), yes. You haven't made the code race  
> free and
> that was the rationale for check_region() deprecating.
>
>     if (request_region()) {
>         release_region();
>         ...
>     }
>
> modulo return values is equivalent to
>
>     if (check_region() == 0) {
>         ...
>     }
>
> Ports that were free will stay free after your combo. Ports that were
> busy will stay busy.
>

And port addresses that are added to the "list" may later be later  
unavailable (like when you get around to reading the list).

> So, a window for races is still in place - before "check_region" and
> final request_region() .
>
> Agree?

I agree that in order to get around some of these issues there would  
need to be some significant restructuring of the code.

You could also argue that the code has worked for a number of years  
"as is" with check_region and would still work with request/release  
region as well. The issues we are discussing were issues in the  
driver from day 1.

>
>

Hmm...

--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

2 + 2 = 5 (For extremely large values of 2)



--===============6800045129627299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6800045129627299==--
