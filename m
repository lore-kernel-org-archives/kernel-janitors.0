From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 02 Oct 2019 07:10:55 +0000
Subject: =?UTF-8?Q?=5bPATCH_1/2=5d_Coccinelle=3a_Move_the_SmPL_script_?= =?UTF-8?Q?=e2=80=9cadd=5fnamespace=2
Message-Id: <2b4e3866-d0fc-e6ca-9977-777b2a0cfc0e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190928094245.45696-1-yuehaibing@huawei.com>
 <7664d59f-78cf-7644-0ee8-304b3d78d752@web.de>
 <alpine.DEB.2.21.1909291840280.3346@hadrien>
 <d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de>
In-Reply-To: <d8c97f0a-6ce2-0f5a-74a9-63366c17f3a6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Martijn Coenen <maco@android.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Yue Haibing <yuehaibing@huawei.com>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 1 Oct 2019 20:56:45 +0200

The script “add_namespace.cocci” was integrated into a known directory
without taking all relevant system dependencies into account
(despite of positive code review feedback).

See also:
* Commit eb8305aecb958e8787e7d603c7765c1dcace3a2b ("scripts: Coccinelle script for namespace dependencies.")

* Topic “[Cocci] [RFC PATCH] scripts: Fix coccicheck failed”
  https://lore.kernel.org/cocci/20191001125742.GD90796@google.com/
  https://systeme.lip6.fr/pipermail/cocci/2019-October/006351.html
  https://lkml.org/lkml/2019/10/1/503


YueHaibing reported then that the standard system configuration
did not work any more as it was expected for the tool “coccicheck”.
https://lore.kernel.org/cocci/20190928094245.45696-1-yuehaibing@huawei.com/
https://systeme.lip6.fr/pipermail/cocci/2019-September/006341.html
https://lkml.org/lkml/2019/9/28/29

The added SmPL script was designed in the way that no corresponding
operation modes were supported so far.
This approach can also work finally if additional script execution
criteria will be taken into account.
Thus move it into a directory which will not be directly included
by the filter command of the tool “coccicheck”.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/{misc => direct}/add_namespace.cocci | 0
 scripts/nsdeps                                          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename scripts/coccinelle/{misc => direct}/add_namespace.cocci (100%)

diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/direct/add_namespace.cocci
similarity index 100%
rename from scripts/coccinelle/misc/add_namespace.cocci
rename to scripts/coccinelle/direct/add_namespace.cocci
diff --git a/scripts/nsdeps b/scripts/nsdeps
index ac2b6031dd13..9000524f9347 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -23,7 +23,7 @@ fi

 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
-		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
+		$srctree/scripts/coccinelle/direct/add_namespace.cocci -D ns=$1 $2
 }

 generate_deps() {
--
2.23.0
