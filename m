From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Tue, 30 Jun 2015 00:31:17 +0000
Subject: Re: vfio: powerpc/spapr: One function call less in tce_iommu_attach_group() after kzalloc() failure
Message-Id: <5591E355.1080708@ozlabs.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <55901E68.80205@users.sourceforge.net>
 <55901FAC.1090109@users.sourceforge.net> <5590862A.3010603@ozlabs.ru>
 <5590DF8A.8030503@users.sourceforge.net>
In-Reply-To: <5590DF8A.8030503@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Michael Ellerman <mpe@ellerman.id.au>

On 06/29/2015 04:02 PM, SF Markus Elfring wrote:
>> tcegrp will be NULL and kfree() can handle this just fine
>
> The affected function did not show this API knowledge, did it?


but you fixed this in 1/2 :)

>
>
>> (is not it the whole point of this patchset
>> - remove the check and just call kfree() even if the pointer is NULL?).
>
> Partly, yes.
>
>
>> And if you wanted another label,
>
> I suggest this to improve corresponding exception handling.
>
>
>> than the existing one should have been renamed to "free_exit" or "free_unlock_exit"
>> and new one would be "unlock_exit".
>
> I chose a smaller change at this place.


I'd just drop this patch.


> I am not familiar enough with other called functions there at the moment.
> Are the remaining goto statements also update candidates?




-- 
Alexey
