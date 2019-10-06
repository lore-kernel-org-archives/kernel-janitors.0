From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 06 Oct 2019 06:40:14 +0000
Subject: Re: [PATCH] scripts: add_namespace: Fix coccicheck failed
Message-Id: <f9862128-8fa2-812e-cfb3-c9953b9e98a2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
 <20191006044456.57608-1-yuehaibing@huawei.com>
In-Reply-To: <20191006044456.57608-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, Julia Lawall <julia.lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

> Now all scripts in scripts/coccinelle to be automatically called
> by coccicheck. However new adding add_namespace.cocci does not
> support report mode, which make coccicheck failed.
> This add "virtual report" to  make the coccicheck go ahead smoothly.

I find that this change description needs improvements and corrections.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135#n151

I would find a commit subject like “scripts: add_namespace:
Add support for the default coccicheck operation mode” more appropriate
(if this software development will be clarified further in the shown direction
at all).


> Fixes: eb8305aecb95 ("scripts: Coccinelle script for namespace dependencies.")

I got the impression that a sub-optimal solution approach would be chosen here.
The automatic script execution is requested despite of the fact
that the input parameter “name space” (SmPL identifier “virtual.ns”)
will be required.

I am curious under which circumstances an other transformation
can become more attractive.
[PATCH 0/2] Coccinelle: Extend directory hierarchy
https://lore.kernel.org/cocci/d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de/
https://lore.kernel.org/patchwork/project/lkml/list/?series=412494
https://lkml.org/lkml/2019/10/2/60


> +++ b/scripts/coccinelle/misc/add_namespace.cocci
> @@ -6,6 +6,8 @@
>  /// add a missing namespace tag to a module source file.
>  ///
>
> +virtual report
> +
>  @has_ns_import@

If you would insist on the complete support for the operation mode “report”
of the tool “coccicheck”, I would eventually expect that another SmPL rule
will provide a helpful message instead of immediately exiting after
the script variable “ns” was defined.
Are you going to take any additional software design options better
into account?

Regards,
Markus
