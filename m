From: Jesse Millan <jesse.millan@gmail.com>
Date: Sun, 25 Sep 2005 02:06:59 +0000
Subject: Re: [KJ] [PATCH] BusLogic: eliminate deprecated check_region() calls
Message-Id: <0274086C-6010-4485-866E-46B3FC71B503@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69129431397844954=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
In-Reply-To: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============69129431397844954==
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


On Sep 24, 2005, at 4:08 PM, Alexey Dobriyan wrote:

> On Sat, Sep 24, 2005 at 11:34:04AM -0700, Jesse Millan wrote:
>
>> On Sep 24, 2005, at 7:30 AM, Alexey Dobriyan wrote:
>>
>>> On Thu, Sep 22, 2005 at 03:06:04PM -0700, Jesse Millan wrote:
>>>
>>>> This patch eliminates the deprecated calls to check_region(). They
>>>> are replaced with request_region(). New version is  a little more
>>>> wordy due to the fact that requst_region() cannot be easily  
>>>> compacted
>>>> into the ? operator.
>>>>
>>>
>>> Can you split it in two parts?
>>>
>>> 1) making selecting logic more readable:
>>>
>>>
>>>> -    if (BusLogic_ProbeOptions.LimitedProbeISA ?
>>>> BusLogic_ProbeOptions.Probe134 : check_region(0x134,
>>>> BusLogic_MultiMasterAddressCount) == 0)
>>>> -        BusLogic_AppendProbeAddressISA(0x134);
>>>> +        if (BusLogic_ProbeOptions.LimitedProbeISA) {
>>>> +                if (BusLogic_ProbeOptions.Probe330)
>>>> +                        BusLogic_AppendProbeAddressISA(0x330);
>>>>
>>>
>>> 2) introducing request_region()
>>>
>>
>> Like so?
>>
>
> Actually not.
>
>
>> I think this is a little clearer.
>>
>> -       if (BusLogic_ProbeOptions.LimitedProbeISA ?
>> BusLogic_ProbeOptions.Probe330 : check_region(0x330,
>> BusLogic_MultiMasterAddressCount) == 0)
>> +        if (BusLogic_ProbeOptions.LimitedProbeISA &&
>> BusLogic_ProbeOptions.Probe330)
>> +                       BusLogic_AppendProbeAddressISA(0x330);
>> +       else if (request_region(0x330,
>> BusLogic_MultiMasterAddressCount, "BusLogic")) {
>> +               release_region(0x330,  
>> BusLogic_MultiMasterAddressCount);
>>                 BusLogic_AppendProbeAddressISA(0x330);
>>
>
> What we have:
>
>     if (A ? B(330) : C(330))
>         D(330);
>     if (A ? B(334) : C(334))
>         D(334);
>     if (A ? B(230) : C(230))
>         D(230);
>     if (A ? B(234) : C(234))
>         D(234);
>     if (A ? B(130) : C(130))
>         D(130);
>     if (A ? B(134) : C(134))
>         D(134);
>
> Unless I'm low on coffee, this should be equivalent to:
>
>     if (A) {
>         if (B(330))
>             D(330);
>         if (B(334))
>             D(334);
>         if (B(230))
>             D(230);
>         if (B(234))
>             D(234);
>         if (B(130))
>             D(130);
>         if (B(134))
>             D(134);
>     } else {
>         if (C(330))
>             D(330);
>         if (C(334))
>             D(334);
>         if (C(230))
>             D(230);
>         if (C(234))
>             D(234);
>         if (C(130))
>             D(130);
>         if (C(134))
>             D(134);
>     }

Which is what I had in the first place right?

Here is the relevant snippet of the first patch:

-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe330 : check_region(0x330,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x330);
-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe334 : check_region(0x334,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x334);
-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe230 : check_region(0x230,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x230);
-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe234 : check_region(0x234,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x234);
-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe130 : check_region(0x130,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x130);
-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
BusLogic_ProbeOptions.Probe134 : check_region(0x134,  
BusLogic_MultiMasterAddressCount) == 0)
-        BusLogic_AppendProbeAddressISA(0x134);
+        if (BusLogic_ProbeOptions.LimitedProbeISA) {
+                if (BusLogic_ProbeOptions.Probe330)
+                        BusLogic_AppendProbeAddressISA(0x330);
+                if (BusLogic_ProbeOptions.Probe334)
+                        BusLogic_AppendProbeAddressISA(0x334);
+                if (BusLogic_ProbeOptions.Probe230)
+                        BusLogic_AppendProbeAddressISA(0x230);
+                if (BusLogic_ProbeOptions.Probe234)
+                        BusLogic_AppendProbeAddressISA(0x234);
+                if (BusLogic_ProbeOptions.Probe130)
+                        BusLogic_AppendProbeAddressISA(0x130);
+                if (BusLogic_ProbeOptions.Probe134)
+                        BusLogic_AppendProbeAddressISA(0x134);
+        } else {
+                if (request_region(0x330,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+                        BusLogic_AppendProbeAddressISA(0x330);
+                        release_region(0x330,  
BusLogic_MultiMasterAddressCount);
+                }
+                if (request_region(0x334,  
BusLogic_MultiMasterAddrhessCount, "BusLogic")) {
+                        BusLogic_AppendProbeAddressISA(0x334);
+                        release_region(0x334,  
BusLogic_MultiMasterAddressCount);
+                }dd
+                if (request_region(0x230,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+            BusLogic_AppendProbeAddressISA(0x230);
+            release_region(0x230, BusLogic_MultiMasterAddressCount);
+        }
+                if (request_region(0x234,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+            BusLogic_AppendProbeAddressISA(0x234);
+            release_region(0x234, BusLogic_MultiMasterAddressCount);
+        }
+                if (request_region(0x130,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+            BusLogic_AppendProbeAddressISA(0x130);
+            release_region(0x130, BusLogic_MultiMasterAddressCount);
+        }
+                if (request_region(0x134,  
BusLogic_MultiMasterAddressCount, "BusLogic")) {
+            BusLogic_AppendProbeAddressISA(0x134);
+            release_region(0x134, BusLogic_MultiMasterAddressCount);
+        }
+    }

I should reverse the order of BusLogic_AppendProbeAddressISA()  
release_region() so that it releases first though. But that's all I see.

>
> C() is check_region(). You can quite easily put
> request_region()/release_region() instead, but name
> BusLogic_InitializeProbeInfoListISA suggests we should just fill some
> list...
>
> Dunno what to do next, the driver is un[censored]readable. :-/
>
>

Your right, there is no real optimizations made here. The patch keeps  
the original flow except for the fact that it eliminates the  
depreciated check_region calls...

--
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Homepage: www.system-calls.com

The question of whether a computer can think is no more interesting  
than the question of whether a submarine can swim. ~E.W. Dijkstra



--===============69129431397844954==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69129431397844954==--
