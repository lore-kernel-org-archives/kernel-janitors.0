From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 03 Jun 2011 19:57:15 +0000
Subject: Re: [Xen-devel] Re: [patch] xen: off by one errors in multicalls.c
Message-Id: <20110603195715.GB30940@dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110603044528.GD3661@shale.localdomain>
	<4DE926D4.9010009@goop.org>
In-Reply-To: <4DE926D4.9010009@goop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: "open list:XEN HYPERVISOR IN..." <xen-devel@lists.xensource.com>, Dan Carpenter <error27@gmail.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, kernel-janitors@vger.kernel.org, "open list:XEN HYPERVISOR IN..." <virtualization@lists.linux-foundation.org>, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>

On Fri, Jun 03, 2011 at 11:24:20AM -0700, Jeremy Fitzhardinge wrote:
> On 06/02/2011 09:45 PM, Dan Carpenter wrote:
> > b->args[] has MC_ARGS elements, so the comparison here should be
> > ">=" instead of ">".  Otherwise we read past the end of the array
> > one space.
> 
> Yeah, looks like a correct fix.  Fortunately I don't think anything
> currently hits that path in practice, though there are some pending
> patches which will exercise it more.

OK, queueing it for rc1.
