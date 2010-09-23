From: matt mooney <mfm@muteddisk.com>
Date: Thu, 23 Sep 2010 17:49:18 +0000
Subject: Re: [PATCH 12/20] powerpc: change to new flag variables
Message-Id: <20100923174918.GA3035@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285224669-29865-1-git-send-email-mfm@muteddisk.com>
	<20100923201923.366779a1.sfr@canb.auug.org.au>
In-Reply-To: <20100923201923.366779a1.sfr@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, Alexander Graf <agraf@suse.de>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Avi Kivity <avi@redhat.com>, linuxppc-dev@lists.ozlabs.org

On 20:19 Thu 23 Sep     , Stephen Rothwell wrote:
> Hi Matt,
> 
> On Wed, 22 Sep 2010 23:51:09 -0700 matt mooney <mfm@muteddisk.com> wrote:
> >
> > Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.
> 
> This looks good.  One comment below ...
> 
> > --- a/arch/powerpc/platforms/pseries/Makefile
> > +++ b/arch/powerpc/platforms/pseries/Makefile
> > @@ -1,10 +1,5 @@
> > -ifeq ($(CONFIG_PPC64),y)
> > -EXTRA_CFLAGS		+= -mno-minimal-toc
> > -endif
> > -
> > -ifeq ($(CONFIG_PPC_PSERIES_DEBUG),y)
> > -EXTRA_CFLAGS		+= -DDEBUG
> > -endif
> > +ccflags-$(CONFIG_PPC64)			:= -mno-minimal-toc
> > +ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
> >  
> >  obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
> >  			   setup.o iommu.o event_sources.o ras.o \
> > @@ -23,7 +18,7 @@ obj-$(CONFIG_MEMORY_HOTPLUG)	+= hotplug-memory.o
> >  obj-$(CONFIG_HVC_CONSOLE)	+= hvconsole.o
> >  obj-$(CONFIG_HVCS)		+= hvcserver.o
> >  obj-$(CONFIG_HCALL_STATS)	+= hvCall_inst.o
> > -obj-$(CONFIG_PHYP_DUMP)	+= phyp_dump.o
> > +obj-$(CONFIG_PHYP_DUMP)		+= phyp_dump.o
> >  obj-$(CONFIG_CMM)		+= cmm.o
> >  obj-$(CONFIG_DTL)		+= dtl.o
> 
> This looks like a spurious extra hunk.

Hi Stephen,

Yeah your right, logically it doesn't follow from my changeset. I should
have left it alone, but it was the only line in the file that didn't align
properly with its surrounding area.

-mfm

