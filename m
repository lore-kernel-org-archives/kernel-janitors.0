From: Dave Jones <davej@redhat.com>
Date: Wed, 17 Mar 2004 00:02:25 +0000
Subject: Re: [Kernel-janitors] tcic kj audit
Message-Id: <20040317000225.GF24623@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <405764AD.6070905@gentoo.org>
In-Reply-To: <405764AD.6070905@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 16, 2004 at 08:33:49PM +0000, Chuck Short wrote:
 > @@ -337,7 +337,7 @@ static int __init is_active(int s)
 >  
 >      if ((sstat & TCIC_SSTAT_CD) && (pwr & TCIC_PWR_VCC(s)) &&
 >  	(scf1 & TCIC_SCF1_IOSTS) && (ioctl & TCIC_ICTL_ENA) &&
 > -	(check_region(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
 > +	(region_request(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
 >  	return 1;
 >      else
 >  	return 0;

I guess you didn't even compile test this one ?

You'll also need to release the region at some point.
check_region fixes aren't just a simple search & replace.

		Dave
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
