From: =?UTF-8?q?Adeodato=20Sim=C3=B3?= <dato@net.com.org.es>
Date: Tue, 13 Nov 2018 04:11:28 +0000
Subject: [PATCH] net/9p: include trans_common.h to fix missing prototype warning.
Message-Id: <b1c4df8f21689b10d451c28fe38e860722d20e71.1542082208.git.dato@net.com.org.es>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This silences -Wmissing-prototypes when defining p9_release_pages.

Signed-off-by: Adeodato Sim=C3=B3 <dato@net.com.org.es>
---
 net/9p/trans_common.c | 1 +
 1 file changed, 1 insertion(+)

It was suggested in the kernel-janitors mailing list that silencing
-Wmissing-prototypes would make for a worthy cause.

https://www.spinics.net/lists/linux-kernel-janitors/msg43981.html

Thanks for considering!

diff --git a/net/9p/trans_common.c b/net/9p/trans_common.c
index b718db2085b2..3dff68f05fb9 100644
--- a/net/9p/trans_common.c
+++ b/net/9p/trans_common.c
@@ -14,6 +14,7 @@
=20
 #include <linux/mm.h>
 #include <linux/module.h>
+#include "trans_common.h"
=20
 /**
  *  p9_release_pages - Release pages after the transaction.
--=20
2.19.1
