From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:21:59 +0000
Subject: [PATCH v2 0/8] Coccinelle: atomic_as_refcounter: Adjustments for source code search specifications
Message-Id: <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
In-Reply-To: <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 19:15:26 +0200

This source code search pattern was programmed in the way that
some implementation details could be improved further.
I suggest to avoid unnecessary code repetition also in this script
for the semantic patch language.

Markus Elfring (8):
  Delete an unnecessary SmPL rule
  Omit placeholder specifications from a SmPL constraint
  Optimise a disjunction in the first SmPL rule
  Use type “expression” for another metavariable
  Replace disjunction by a constraint in two SmPL rules
  Use nested disjunctions in the first SmPL rule
  Use string literals directly in two SmPL rules
  Use format string directly in the first SmPL rule

---

V2:
Possible changes were recombined after the deletion of a questionable
SmPL rule.

 .../coccinelle/api/atomic_as_refcounter.cocci | 108 ++++--------------
 1 file changed, 24 insertions(+), 84 deletions(-)

-- 
2.18.0

