From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 18:32:10 +0000
Subject: Re: [PATCH 00/10] scripts/basic: Fine-tuning for seven function implementations
Message-Id: <9fcfb92e-2362-7111-e68f-5f6de02648e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Jim Davis <jim.epost@gmail.com>

> Date: Fri, 28 Oct 2016 10:18:10 +0200
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (10):
>   bin2c: Complete error handling in main()
>   fixdep: Complete error handling in print_deps()
>   fixdep: Use the symbol "MAP_FAILED" in print_deps()
>   fixdep: Fix error log output in print_deps()
>   fixdep: Complete error handling in parse_dep_file()
>   fixdep: Complete error handling in do_config_file()
>   fixdep: Fix error log output in do_config_file()
>   fixdep: Complete error handling in print_config()
>   fixdep: Complete error handling in print_cmdline()
>   fixdep: Combine two fprintf() calls into one fputs() call in usage()
> 
>  scripts/basic/bin2c.c  |  26 ++++++----
>  scripts/basic/fixdep.c | 131 +++++++++++++++++++++++++++++++++----------------
>  2 files changed, 105 insertions(+), 52 deletions(-)

Are these update suggestions worth for another look?
https://lkml.org/lkml/2016/10/28/138

Regards,
Markus
