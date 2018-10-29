From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 29 Oct 2018 13:20:01 +0000
Subject: Re: [PATCH] drivers/perf: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181029132001.GD21857@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181026175839.4565-1-colin.king@canonical.com>
 <20181029122854.GB20813@kernel.org>
 <20181029123357.GA21857@kernel.org>
 <20181029123656.GB57235@gmail.com>
In-Reply-To: <20181029123656.GB57235@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: Colin King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Em Mon, Oct 29, 2018 at 01:36:56PM +0100, Ingo Molnar escreveu:
> 
> * Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> 
> > Em Mon, Oct 29, 2018 at 09:28:54AM -0300, Arnaldo Carvalho de Melo escreveu:
> > > Em Fri, Oct 26, 2018 at 06:58:39PM +0100, Colin King escreveu:
> > > > From: Colin Ian King <colin.king@canonical.com>
> > > > 
> > > > Trivial fix to a spelling mistake of the error access name EACCESS,
> > > > rename to EACCES
> > > 
> > > Thanks, applied.
> > > 
> > > And I also took the chance to fix another spelling mistake, on this same
> > > line:
> > > 
> > > -        *  -EACCESS    -- @event is for this PMU, @event is valid, but no privilidges
> > > +        *  -EACCES     -- @event is for this PMU, @event is valid, but no privilidges
> > >                                                                                  ^
> > >                                                                                  ^
> > >                                                                                  ^
> > >                                                                                  ^
> > 
> > But I see Ingo has already merged your patch, lets fix that one later
> > then :-)
> 
> I zapped my commit, please let's merge your upgraded version.
> 
> BTW., while at it, could we also try a header refresh now that a lot of 
> the merge window changes to headers are behind us, this is from the 
> perf/urgent build (f0718d792b8a)"
> 
> Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h'
> diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
> Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differs from latest version at 'include/uapi/sound/asound.h'
> diff -u tools/include/uapi/sound/asound.h include/uapi/sound/asound.h
> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
> diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
> Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' differs from latest version at 'arch/x86/include/uapi/asm/kvm.h'
> diff -u tools/arch/x86/include/uapi/asm/kvm.h arch/x86/include/uapi/asm/kvm.h
> Warning: Kernel ABI header at 'tools/arch/powerpc/include/uapi/asm/kvm.h' differs from latest version at 'arch/powerpc/include/uapi/asm/kvm.h'
> diff -u tools/arch/powerpc/include/uapi/asm/kvm.h arch/powerpc/include/uapi/asm/kvm.h
> Warning: Kernel ABI header at 'tools/arch/s390/include/uapi/asm/kvm.h' differs from latest version at 'arch/s390/include/uapi/asm/kvm.h'
> diff -u tools/arch/s390/include/uapi/asm/kvm.h arch/s390/include/uapi/asm/kvm.h
> Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/unistd.h' differs from latest version at 'arch/arm64/include/uapi/asm/unistd.h'
> diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h
> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h'
> diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
> Warning: Kernel ABI header at 'tools/include/uapi/linux/mman.h' differs from latest version at 'include/uapi/linux/mman.h'
> diff -u tools/include/uapi/linux/mman.h include/uapi/linux/mman.h
> 
> ?
> 
> Thanks!

Ok, I'll put together a perf/urgent with those things resolved, may take
a day or two as I'm working on addressing DaveM's reported issues and in
fixing the regressions that that "remove fallback to kallsyms for
userspace addresses" patch caused.

- Arnaldo
