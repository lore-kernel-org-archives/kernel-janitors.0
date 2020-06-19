From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 19 Jun 2020 15:26:32 +0000
Subject: Re: [PATCH] coccinelle: api/kstrdup: fix coccinelle position
Message-Id: <0f221342-cd9c-04d2-da01-f86574d3de34@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> There is a typo in rule r2. Position p1 should be attached to kzalloc() call.

I find such a suggestion reasonable for an implementation detail.

I would find an other patch subject clearer.


How do you think about to move the specification “@p1” out of SmPL disjunctions?

Regards,
Markus
