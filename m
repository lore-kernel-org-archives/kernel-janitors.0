From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 13 Dec 2019 17:08:45 +0000
Subject: Re: [PATCH] pstore/ram: Fix memory leak in persistent_ram_new
Message-Id: <8c374545-b493-3be8-3753-a6fdd574f82c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191211191353.14385-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191211191353.14385-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>, Colin Cross <ccross@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Navid Emamdoost <emamd001@umn.edu>, Tony Luck <tony.luck@intel.com>

> In the implementation of persistent_ram_new(), if the allocation for prz
> fails, "label" should be released as part of error handling.

How did you come to this conclusion?

I suggest to reconsider this patch because the mentioned string is passed by
a function parameter.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/pstore/ram_core.c?id7d4e84f765bb3038ddfeebdc5d1cfd7e1ef688f#n561
https://elixir.bootlin.com/linux/v5.5-rc1/source/fs/pstore/ram_core.c#L561

I recognise other implementation details which could be improved here.
https://lore.kernel.org/lkml/97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net/
https://lkml.org/lkml/2017/8/16/645

Regards,
Markus
