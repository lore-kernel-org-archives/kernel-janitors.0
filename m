From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 15:58:06 +0000
Subject: [PATCH] arch/metag/kernel/cachepart.c: fix failure check
Message-Id: <1405612686-3554-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140717145811.GI25880@mwanda>
In-Reply-To: <20140717145811.GI25880@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-metag@vger.kernel.org
Cc: james.hogan@imgtec.com, dan.carpenter@oracle.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/arch/metag/kernel/cachepart.c:102]: (style) Checking if
unsigned variable 'thread_cache_size' is less than zero.

Source code is

        if (thread_cache_size < 0)
            pr_emerg("Can't read %s cache size\n",
                 cache_type ? "DCACHE" : "ICACHE");

but

    unsigned int thread_cache_size;

Function get_thread_cache_size returns an error code
as (unsigned int) -1.

Changed get_thread_cache_size() to return signed int, and its result is sto=
red
into signed int variable.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80361
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 arch/metag/kernel/cachepart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/metag/kernel/cachepart.c b/arch/metag/kernel/cachepart.c
index 0a2385f..04b7d4f 100644
--- a/arch/metag/kernel/cachepart.c
+++ b/arch/metag/kernel/cachepart.c
@@ -55,7 +55,7 @@ unsigned int get_global_icache_size(void)
 	return (get_icache_size() * ((temp >> SYSC_xCPARTG_AND_S) + 1)) >> 4;
 }
=20
-static unsigned int get_thread_cache_size(unsigned int cache, int thread_i=
d)
+static int get_thread_cache_size(unsigned int cache, int thread_id)
 {
 	unsigned int cache_size;
 	unsigned int t_cache_part;
@@ -94,7 +94,7 @@ static unsigned int get_thread_cache_size(unsigned int ca=
che, int thread_id)
=20
 void check_for_cache_aliasing(int thread_id)
 {
-	unsigned int thread_cache_size;
+	int thread_cache_size;
 	unsigned int cache_type;
 	for (cache_type =3D ICACHE; cache_type <=3D DCACHE; cache_type++) {
 		thread_cache_size --=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
