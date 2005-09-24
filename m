From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 24 Sep 2005 14:30:37 +0000
Subject: Re: [KJ] [PATCH] BusLogic: eliminate deprecated check_region() calls
Message-Id: <20050924143037.GC18935@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83180447689721548=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
In-Reply-To: <CCEA3863-4FEA-409F-9024-B3BEB03C7263@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============83180447689721548==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 22, 2005 at 03:06:04PM -0700, Jesse Millan wrote:
> This patch eliminates the deprecated calls to check_region(). They  
> are replaced with request_region(). New version is  a little more  
> wordy due to the fact that requst_region() cannot be easily compacted  
> into the ? operator.

Can you split it in two parts?

1) making selecting logic more readable:

> -	if (BusLogic_ProbeOptions.LimitedProbeISA ? BusLogic_ProbeOptions.Probe134 : check_region(0x134, BusLogic_MultiMasterAddressCount) == 0)
> -		BusLogic_AppendProbeAddressISA(0x134);
> +        if (BusLogic_ProbeOptions.LimitedProbeISA) {
> +                if (BusLogic_ProbeOptions.Probe330)
> +                        BusLogic_AppendProbeAddressISA(0x330);

2) introducing request_region()


--===============83180447689721548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83180447689721548==--
