From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Date: Wed, 04 Mar 2015 16:41:40 +0000
Subject: Re: x86/intel/quark: Add Isolated Memory Regions for Quark X1000
Message-Id: <54F735C4.5010408@nexus-software.ie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150304150648.GA26187@mwanda>
In-Reply-To: <20150304150648.GA26187@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 04/03/15 15:06, Dan Carpenter wrote:
>     228                  if (imr_is_enabled(&imr)) {
>     229                          base = imr_to_phys(imr.addr_lo);
>
> The imr_to_phys() macro should probably include a cast to phys_addr_t if
> only to silence the static checker warnings.

Fair point, applicable to phys_to_imr() for completeness.

--
BOD
