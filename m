From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 22 Mar 2020 16:57:02 +0000
Subject: [PATCH] err.h: remove deprecated PTR_RET for good
Message-Id: <20200322165702.6712-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jiri Kosina <trivial@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Gustavo A . R . Silva" <gustavo@embeddedor.com>, Nicholas Krause <xerofoify@gmail.com>, Duan Jiong <duanj.fnst@cn.fujitsu.com>, Sachin Kamat <sachin.kamat@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Initially, commit fa9ee9c4b988 ("include/linux/err.h: add a function to
cast error-pointers to a return value") from Uwe Kleine-K=C3=B6nig introduc=
ed
PTR_RET in 03/2011. Then, in 07/2013, commit 6e8b8726ad50 ("PTR_RET is
now PTR_ERR_OR_ZERO") from Rusty Russell renamed PTR_RET to
PTR_ERR_OR_ZERO, and left PTR_RET as deprecated-marked alias.

After six years since the renaming and various repeated cleanups in the
meantime, it is time to finally remove the deprecated PTR_RET for good.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Rusty, if you are still around, Acked-by is appreciated.
Uwe, Acked-by is appreciated.
Kudos to Gustavo, Nicholas, Duan & Sachin for previous cleanups.

applies cleanly on current master and on next-20200320
Jiri, please pick this trival patch for the next merge window. Thanks.

 include/linux/err.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/err.h b/include/linux/err.h
index 87be24350e91..a139c64aef2a 100644
--- a/include/linux/err.h
+++ b/include/linux/err.h
@@ -62,9 +62,6 @@ static inline int __must_check PTR_ERR_OR_ZERO(__force co=
nst void *ptr)
 		return 0;
 }
=20
-/* Deprecated */
-#define PTR_RET(p) PTR_ERR_OR_ZERO(p)
-
 #endif
=20
 #endif /* _LINUX_ERR_H */
--=20
2.17.1
