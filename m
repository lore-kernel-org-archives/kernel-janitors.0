From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 11:17:53 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <21684307-d05c-1856-c849-95436aedeb86@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
In-Reply-To: <CAK7LNAS2K6i+s2A_xTyRq730M6_=tyjtfwHAnEHF37_nrJa4Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Martijn Coenen <maco@android.com>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>
Cc: linux-kernel@vger.kernel.org

> You gave Acked-by to the one-liner fix "virtual report",

It was (temporarily?) accepted to use the script “add_namespace.cocci”
without such a type of SmPL variable.


> and I am happy to apply it to my tree.

Would you like to take the change possibility into account
that the coccicheck system configuration should be adapted instead?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccicheck?id=4ea655343ce4180fe9b2c7ec8cb8ef9884a47901#n257

Regards,
Markus
