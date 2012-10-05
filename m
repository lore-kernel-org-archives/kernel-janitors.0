From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Oct 2012 01:09:59 +0000
Subject: Re: [samsung:devfreq-for-next 4/4] drivers/devfreq/devfreq.c:639:16: error: invalid storage class fo
Message-Id: <20121005010959.GA7437@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121005010649.GA6635@localhost>
In-Reply-To: <20121005010649.GA6635@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 05, 2012 at 09:06:49AM +0800, Fengguang Wu wrote:
> Hi MyungJoo,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.infradead.org/users/kmpark/linux-samsung devfreq-for-next
> head:   6f2fe082f51cf10ea622e21bff4f5d313decee36
> commit: 6f2fe082f51cf10ea622e21bff4f5d313decee36 [4/4] PM / devfreq: add global PM QoS support
> config: x86_64-allyesconfig
> 
> Note: the HEAD commit builds fine. It only hurts bisectibility.

That "Note" is obviously wrong. Sorry, it should be a bug in the build system.

Thanks,
Fengguang
