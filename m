From: Alan Cox <alan@linux.intel.com>
Date: Thu, 18 Nov 2010 20:18:08 +0000
Subject: Re: [PATCH 1/4] x86: platform: mrst: check
Message-Id: <20101118201808.06731611@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290104207-31279-1-git-send-email-segoon@openwall.com>
	<20101118181814.290811f0@linux.intel.com>
	<20101118184419.GA31886@albatros>
In-Reply-To: <20101118184419.GA31886@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Feng Tang <feng.tang@intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, linux-kernel@vger.kernel.org

On Thu, 18 Nov 2010 21:44:21 +0300
Vasiliy Kulikov <segoon@openwall.com> wrote:

> On Thu, Nov 18, 2010 at 18:18 +0000, Alan Cox wrote:
> > >  I cannot compile this driver in next-20101117, so it is not
> > > tested at all.
> > 
> > Compile or test - if it bombs out compiling for you please send me
> > (off list the .config that fails so I can fix that
> > 
> > Otherwise NAK the patch because it needs to do the cleanup but
> > thanks for finding the bug - you've done the hard 99%
> 
> make -C /home/vasya/linux arch/x86/platform/mrst/vrtc.o
> make: Entering directory `/home/vasya/dev/linux-next'
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CC      arch/x86/platform/mrst/vrtc.o
> arch/x86/platform/mrst/vrtc.c: In function 'mrst_rtc_init':
> arch/x86/platform/mrst/vrtc.c:113: error: 'FIX_LNW_VRTC' undeclared
> (first use in this function) arch/x86/platform/mrst/vrtc.c:113:
> error: (Each undeclared identifier is reported only once
> arch/x86/platform/mrst/vrtc.c:113: error: for each function it
> appears in.) make[1]: *** [arch/x86/platform/mrst/vrtc.o] Error 1
> 
> Both with allyesconfig and allmodconfig, x86_64.

I can't duplicate this.

It's defined if CONFIG_X86_MRST is defined, and the file in question is
only compiled if CONFIG_X86_MRST is defined



