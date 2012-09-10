From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Mon, 10 Sep 2012 05:18:31 +0000
Subject: Re: [powerpc:next 60/78] arch/powerpc/platforms/pseries/eeh_pe.c:217:23: error: 'eeh_pe_get' defined
Message-Id: <1347254311.11820.0.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910023442.GB29863@localhost>
 <20120910025121.GB1572@shangw.(null)>
In-Reply-To: <20120910025121.GB1572@shangw.(null)>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gavin Shan <shangw@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org

On Mon, 2012-09-10 at 10:51 +0800, Gavin Shan wrote:
> >
> 
> The global functions eeh_pe_get() and eeh_pe_get_parent() will be used
> by subsequent patches. I think ppc/next merged 23 patches for EEH core
> this time. I'm not sure I should refactor those patches to avoid the
> build failure? :-)

No, don't bother, it's a case where gcc warnings are a bit too zealous.
Next time we'll try to avoid it but for now, I won't rebase.

Cheers,
Ben.


