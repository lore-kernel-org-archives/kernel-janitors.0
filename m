From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 25 Sep 2005 08:44:35 +0000
Subject: Re: [KJ] [PATCH][RESEND] BusLogic: eliminate deprecated
Message-Id: <20050925084435.GA21479@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71991729880638522=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <70805EB9-1C7E-4413-B2DC-1D53C88B1BA7@gmail.com>
In-Reply-To: <70805EB9-1C7E-4413-B2DC-1D53C88B1BA7@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============71991729880638522==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 24, 2005 at 07:13:15PM -0700, Jesse Millan wrote:
> This patch eliminates the deprecated calls to check_region(). It's  
> replaced with request_region(). New version is  a little more wordy  
> due to the fact that requst_region() cannot be easily compacted into  
> the ? operator.

I _was_ low on coffee:

> -	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe330 : check_region(0x330, BusLogic_MultiMasterAddressCount) == 0)
> -		BusLogic_AppendProbeAddressISA(0x330);
> +	if(BusLogic_ProbeOptions.LimitedProbeISA) {
> +		if(BusLogic_ProbeOptions.Probe330)
> +			BusLogic_AppendProbeAddressISA(0x330);
> +	} else {
> +		if(request_region(0x330, BusLogic_MultiMasterAddressCount, "BusLogic")) {
> +			release_region(0x330, BusLogic_MultiMasterAddressCount)
> +			BusLogic_AppendProbeAddressISA(0x330);
> +		}
> +	}

You removed check_region(), yes. You haven't made the code race free and
that was the rationale for check_region() deprecating.

	if (request_region()) {
		release_region();
		...
	}

modulo return values is equivalent to

	if (check_region() == 0) {
		...
	}

Ports that were free will stay free after your combo. Ports that were
busy will stay busy.

So, a window for races is still in place - before "check_region" and
final request_region() .

Agree?


--===============71991729880638522==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71991729880638522==--
