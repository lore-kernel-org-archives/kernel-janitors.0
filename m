From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 02:56:44 +0000
Subject: Re: [powerpc:next 60/78] arch/powerpc/platforms/pseries/eeh_pe.c:217:23: error: 'eeh_pe_get' defined
Message-Id: <20120910025644.GA30229@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910023442.GB29863@localhost>
 <20120910025121.GB1572@shangw.(null)>
In-Reply-To: <20120910025121.GB1572@shangw.(null)>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gavin Shan <shangw@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Mon, Sep 10, 2012 at 10:51:22AM +0800, Gavin Shan wrote:
> Hi Fengguang,
> 
> >Hi Gavin,
> >
> >FYI, kernel build failed on
> >
> >tree:   git://git.kernel.org/pub/scm/linux/kernel/git/benh/powerpc.git next
> >head:   4715fed600109e0bd3d6cfa2b925a643173a08b4
> >commit: 22f4ab123f10e1862579785c73d9e60fa24afd4f [60/78] powerpc/eeh: Search PE based on requirement
> >config: powerpc-defconfig (attached as .config)
> >
> >All related error/warning messages:
> >
> >arch/powerpc/platforms/pseries/eeh_pe.c:217:23: error: 'eeh_pe_get' defined but not used [-Werror=unused-function]
> >arch/powerpc/platforms/pseries/eeh_pe.c:237:23: error: 'eeh_pe_get_parent' defined but not used [-Werror=unused-function]
> >cc1: all warnings being treated as errors
> >
> 
> The global functions eeh_pe_get() and eeh_pe_get_parent() will be used
> by subsequent patches. I think ppc/next merged 23 patches for EEH core
> this time. I'm not sure I should refactor those patches to avoid the
> build failure? :-)

I guess it's not your fault.. I have rules to filter out
"unused-function" warnings, however in your case all warnings are
turned into errors.. Although I can filter such errors too, they will
still present as bisect holes.

Thanks,
Fengguang
