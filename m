From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:26:26 +0000
Subject: [PATCH 1/3] arch/metag/kernel/cachepart.c: fix failure check
Message-Id: <1405603586-12515-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-metag@vger.kernel.org
Cc: james.hogan@imgtec.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/arch/metag/kernel/cachepart.c:102]: (style) Checking if uns=
igned variable 'thread_cache_size' is less than zero.

Source code is

        if (thread_cache_size < 0)
            pr_emerg("Can't read %s cache size\n",
                 cache_type ? "DCACHE" : "ICACHE");

but

    unsigned int thread_cache_size;

Function get_thread_cache_size returns an error code
as (unsigned int) -1.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80361
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 arch/metag/kernel/cachepart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/metag/kernel/cachepart.c b/arch/metag/kernel/cachepart.c
index 0a2385f..b137034 100644
--- a/arch/metag/kernel/cachepart.c
+++ b/arch/metag/kernel/cachepart.c
@@ -99,7 +99,7 @@ void check_for_cache_aliasing(int thread_id)
 	for (cache_type =3D ICACHE; cache_type <=3D DCACHE; cache_type++) {
 		thread_cache_size  				get_thread_cache_size(cache_type, thread_id);
-		if (thread_cache_size < 0)
+		if (thread_cache_size =3D (unsigned int)-1)
 			pr_emerg("Can't read %s cache size\n",
 				 cache_type ? "DCACHE" : "ICACHE");
 		else if (thread_cache_size =3D 0)
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
