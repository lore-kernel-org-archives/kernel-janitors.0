From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:30:33 +0000
Subject: [PATCH 0/6] Coccinelle: atomic_as_refcounter: Improvements for source code search specifications
Message-Id: <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
In-Reply-To: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Jul 2018 09:15:26 +0200

This source code search pattern was programmed in the way that
some implementation details could be improved further.
I suggest to avoid unnecessary code repetition also in this script
for the semantic patch language.

Markus Elfring (6):
  Omit placeholder specifications from two SmPL constraints
  Optimise a disjunction in the first SmPL rule
  Use type “expression” for another metavariable
  Replace disjunction by a constraint in two SmPL rules
  Use nested disjunctions in two SmPL rules
  Use format strings directly in SmPL rules

 .../coccinelle/api/atomic_as_refcounter.cocci | 104 +++++++-----------
 1 file changed, 39 insertions(+), 65 deletions(-)

-- 
2.18.0

