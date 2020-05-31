From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 17:36:49 +0000
Subject: Re: [PATCH 1/2] Coccinelle: extend memdup_user transformation with GFP_USER
Message-Id: <2631dbba-f38c-02fd-6c20-e4fe7ed2c00f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Match GFP_USER allocations with memdup_user.cocci rule.

Can this software extension help also for the clarification of the topic
“Safer source code analysis by "memdup_user.cocci"”?
https://github.com/coccinelle/coccinelle/issues/78

Regards,
Markus
