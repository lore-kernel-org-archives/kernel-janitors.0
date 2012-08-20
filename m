From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 20 Aug 2012 08:26:41 +0000
Subject: Re: [userns:userns-always-map-user-v46 78/99] include/linux/proc_fs.h:233:13: error: 'proc_ns_inode'
Message-Id: <20120820082641.GA2302@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819115031.GA20588@localhost>
In-Reply-To: <20120819115031.GA20588@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 12:37:00AM -0700, Eric W. Biederman wrote:
> Fengguang Wu <fengguang.wu@intel.com> writes:
> 
> > Hi Eric,
> >
> > FYI, kernel build failed on
> 
> I was definitely missing an inline, but did that really cause a build failure?
> 
> Does sh set -Werr across the entire kerenl?  That seems reckless.

A grep shows:

arch/sh/mm/Makefile:ccflags-y := -Werror
arch/sh/cchips/hd6446x/Makefile:ccflags-y := -Werror
arch/sh/kernel/Makefile:ccflags-y := -Werror
arch/sh/lib/Makefile:ccflags-y := -Werror

Thanks,
Fengguang
