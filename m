From: Jesse Millan <jesse.millan@gmail.com>
Date: Sat, 24 Sep 2005 18:34:04 +0000
Subject: Re: [KJ] [PATCH] BusLogic: eliminate deprecated check_region() calls
Message-Id: <2D997735-A38C-4D61-BF1D-958E29CB26E2@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97680725320511719=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
In-Reply-To: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============97680725320511719==
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Sep 24, 2005, at 7:30 AM, Alexey Dobriyan wrote:

> On Thu, Sep 22, 2005 at 03:06:04PM -0700, Jesse Millan wrote:
>
>> This patch eliminates the deprecated calls to check_region(). They
>> are replaced with request_region(). New version is  a little more
>> wordy due to the fact that requst_region() cannot be easily compacted
>> into the ? operator.
>>
>
> Can you split it in two parts?
>
> 1) making selecting logic more readable:
>
>
>> -    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
>> BusLogic_ProbeOptions.Probe134 : check_region(0x134,  
>> BusLogic_MultiMasterAddressCount) == 0)
>> -        BusLogic_AppendProbeAddressISA(0x134);
>> +        if (BusLogic_ProbeOptions.LimitedProbeISA) {
>> +                if (BusLogic_ProbeOptions.Probe330)
>> +                        BusLogic_AppendProbeAddressISA(0x330);
>>
>
> 2) introducing request_region()
>
>

Like so? I think this is a little clearer.

-       if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe330 : check_region(0x330,  
BusLogic_MultiMasterAddressCount) == 0)
+        if (BusLogic_ProbeOptions.LimitedProbeISA &&  
BusLogic_ProbeOptions.Probe330)
+                       BusLogic_AppendProbeAddressISA(0x330);
+       else if (request_region(0x330,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+               release_region(0x330, BusLogic_MultiMasterAddressCount);
                 BusLogic_AppendProbeAddressISA(0x330);
...

--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc



--===============97680725320511719==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97680725320511719==--
