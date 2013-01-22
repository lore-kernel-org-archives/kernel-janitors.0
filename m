From: Laurent Navet <laurent.navet@gmail.com>
Date: Tue, 22 Jan 2013 13:07:38 +0000
Subject: Re: build regressions 2013-01-12
Message-Id: <CAH7P7Nj4v58Ga4jSM0YKTA9Q7Emdj4Ugha8dCWc6JNX2XRctnQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50f1d727.cUHAu8+k9jxkI22j%fengguang.wu@intel.com>
In-Reply-To: <50f1d727.cUHAu8+k9jxkI22j%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

> This summary of error messages mainly serves to avoid duplicate
> reports/fixing. For example, when someone hit a build error, he may
> find this email via google and get to know that it has already been
> caught and reported by the 0day kernel build test system.
>
>> How do we know which kernel tree is build, where is the .config ?
>
> Most of the error messages are bisected and directly email reported to
> the bad commit's author/committers with the tree/branch/commit/config
> information, for example:
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> akpm
> head:   799385ad830581545b29a54419806af1a9fabb3b
> commit: 8a374951fb822d160bfe80b27555e5a6e14c1916 [42/325] sched:
> /proc/sched_stat fails on very very large machines
> config: make ARCH=x86_64 allmodconfig

Thank's for the explanation!

> Another small set of possibly false positive error messages that need
> manual checks are reported to kbuild@01.org, which are taken care of
> by community volunteers:
>
>         https://lists.01.org/mailman/listinfo/kbuild
>
> That's where you may really help us. :)

Subscribed, let's see what happens,

Regards,
