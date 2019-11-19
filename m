From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 21:08:24 +0000
Subject: [PATCH 3/4 v2] coccinelle: platform_get_irq: allow multiple dev_errs
Message-Id: <1574197705-31132-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1574197705-31132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr

Allow multiple calls to dev_err in the if branch under the
call to the platform_get_irq function.  Remove only the
first one.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: no change

 scripts/coccinelle/api/platform_get_irq.cocci |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/api/platform_get_irq.cocci b/scripts/coccinelle/api/platform_get_irq.cocci
index 7ac32ee..e5d04fb 100644
--- a/scripts/coccinelle/api/platform_get_irq.cocci
+++ b/scripts/coccinelle/api/platform_get_irq.cocci
@@ -70,7 +70,7 @@ if ( \( ret < 0 \| ret <= 0 \) )
 ...
 -dev_err(...);
 )
-...
+... when any
 }
 
 @r depends on org || report@
