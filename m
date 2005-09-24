From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 24 Sep 2005 23:08:58 +0000
Subject: Re: [KJ] [PATCH] BusLogic: eliminate deprecated check_region() calls
Message-Id: <20050924230858.GC18795@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53566487548854758=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
In-Reply-To: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============53566487548854758==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 24, 2005 at 11:34:04AM -0700, Jesse Millan wrote:
> On Sep 24, 2005, at 7:30 AM, Alexey Dobriyan wrote:
> >On Thu, Sep 22, 2005 at 03:06:04PM -0700, Jesse Millan wrote:
> >>This patch eliminates the deprecated calls to check_region(). They
> >>are replaced with request_region(). New version is  a little more
> >>wordy due to the fact that requst_region() cannot be easily compacted
> >>into the ? operator.
> >
> >Can you split it in two parts?
> >
> >1) making selecting logic more readable:
> >
> >>-    if (BusLogic_ProbeOptions.LimitedProbeISA ?  
> >>BusLogic_ProbeOptions.Probe134 : check_region(0x134,  
> >>BusLogic_MultiMasterAddressCount) == 0)
> >>-        BusLogic_AppendProbeAddressISA(0x134);
> >>+        if (BusLogic_ProbeOptions.LimitedProbeISA) {
> >>+                if (BusLogic_ProbeOptions.Probe330)
> >>+                        BusLogic_AppendProbeAddressISA(0x330);
> >
> >2) introducing request_region()
> 
> Like so?

Actually not.

> I think this is a little clearer.
> 
> -       if (BusLogic_ProbeOptions.LimitedProbeISA ?  
> BusLogic_ProbeOptions.Probe330 : check_region(0x330,  
> BusLogic_MultiMasterAddressCount) == 0)
> +        if (BusLogic_ProbeOptions.LimitedProbeISA &&  
> BusLogic_ProbeOptions.Probe330)
> +                       BusLogic_AppendProbeAddressISA(0x330);
> +       else if (request_region(0x330,  
> BusLogic_MultiMasterAddressCount, "BusLogic")) {
> +               release_region(0x330, BusLogic_MultiMasterAddressCount);
>                 BusLogic_AppendProbeAddressISA(0x330);

What we have:

	if (A ? B(330) : C(330))
		D(330);
	if (A ? B(334) : C(334))
		D(334);
	if (A ? B(230) : C(230))
		D(230);
	if (A ? B(234) : C(234))
		D(234);
	if (A ? B(130) : C(130))
		D(130);
	if (A ? B(134) : C(134))
		D(134);

Unless I'm low on coffee, this should be equivalent to:

	if (A) {
		if (B(330))
			D(330);
		if (B(334))
			D(334);
		if (B(230))
			D(230);
		if (B(234))
			D(234);
		if (B(130))
			D(130);
		if (B(134))
			D(134);
	} else {
		if (C(330))
			D(330);
		if (C(334))
			D(334);
		if (C(230))
			D(230);
		if (C(234))
			D(234);
		if (C(130))
			D(130);
		if (C(134))
			D(134);
	}

C() is check_region(). You can quite easily put
request_region()/release_region() instead, but name
BusLogic_InitializeProbeInfoListISA suggests we should just fill some
list...

Dunno what to do next, the driver is un[censored]readable. :-/


--===============53566487548854758==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53566487548854758==--
