From: Alexander Shiyan <shc_work@mail.ru>
Date: Wed, 29 Aug 2012 16:13:38 +0000
Subject: Re: [asoc:for-next 127/128] make[1]: *** No rule to make target `sound/soc/ep93xx'.
Message-Id: <20120829201338.bc007a27.shc_work@mail.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 28 Aug 2012 22:38:56 -0700
Fengguang Wu <fengguang.wu@intel.com> wrote:

> FYI, kernel build failed on
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> head:   03a5da2b72ba426ed475795db375fc7780338ff4
> commit: 0ed275eff31029c39355828cb48c46c0a006e2f8 [127/128] ASoC: Rename ep93xx soc directory to cirrus
> config: x86_64-allyesconfig (attached as .config)
> Build errors:
> make[1]: *** No rule to make target `sound/soc/ep93xx'.

Cannot reproduce this bug.  Possible this breakage may be resolved by run
"make distclean" before "make all".

-- 
Alexander Shiyan <shc_work@mail.ru>
