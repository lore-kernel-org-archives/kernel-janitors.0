From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Wed, 03 Nov 2010 14:18:01 +0000
Subject: Re: [PATCH 2/3 RESEND] powerpc: remove cast from void*
Message-Id: <1288793881.2147.73.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1285638395.git.mfm@muteddisk.com>
	<f7d601da574581e9dfdc1314a969475c73491c00.1285638395.git.mfm@muteddisk.com>
	<alpine.LNX.2.00.1011031015150.15851@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1011031015150.15851@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: matt mooney <mfm@muteddisk.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>

On Wed, 2010-11-03 at 10:15 -0400, Jiri Kosina wrote:
> On Mon, 27 Sep 2010, matt mooney wrote:
> 
> > Unnecessary cast from void* in assignment.
> > 
> > Signed-off-by: matt mooney <mfm@muteddisk.com>
> > ---
> >  arch/powerpc/platforms/pseries/hvCall_inst.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/hvCall_inst.c b/arch/powerpc/platforms/pseries/hvCall_inst.c
> > index e19ff02..f106662 100644
> > --- a/arch/powerpc/platforms/pseries/hvCall_inst.c
> > +++ b/arch/powerpc/platforms/pseries/hvCall_inst.c
> > @@ -55,7 +55,7 @@ static void hc_stop(struct seq_file *m, void *p)
> >  static int hc_show(struct seq_file *m, void *p)
> >  {
> >  	unsigned long h_num = (unsigned long)p;
> > -	struct hcall_stats *hs = (struct hcall_stats *)m->private;
> > +	struct hcall_stats *hs = m->private;
> >  
> >  	if (hs[h_num].num_calls) {
> >  		if (cpu_has_feature(CPU_FTR_PURR))
> 
> This doesn't seem to be present in 37-rc1, so I am taking it to trivial 
> queue. If this has been already merged to another tree, let me know.

Looks like I missed it, but Ack.

Cheers,
Ben.


