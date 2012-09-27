From: Anton Vorontsov <anton.vorontsov@linaro.org>
Date: Thu, 27 Sep 2012 01:39:33 +0000
Subject: Re: [tty:tty-next 36/40] kernel/debug/kdb/kdb_main.c:2839:4: warning: passing argument 2 of 'kdb_reg
Message-Id: <20120927013930.GA27336@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927012916.GA9207@localhost>
In-Reply-To: <20120927012916.GA9207@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>

On Thu, Sep 27, 2012 at 09:29:16AM +0800, Fengguang Wu wrote:
> FYI, there are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
> head:   0c57dfcc6c1d037243c2f8fbf62eab3633326ec0
> commit: 729043e82cdd403a131127254528afea8031ebab [36/40] kdb: Turn KGDB_KDB=n stubs into static inlines
> config: cris-allyesconfig
> 
> All warnings (together with lots of *old* errors):

As we switched from empty macros to proper type-checking functions, the
new warnings most probably are all OK, but just to be sure...

Which are the new warnings? Do you have old build logs to compare?

And KDB is (and was) obviously broken for cris, should we disable it via
Kconfig?

Thanks,
Anton.
