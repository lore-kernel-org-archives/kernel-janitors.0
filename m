From: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>
Date: Thu, 18 Jan 2018 15:08:05 +0000
Subject: [PATCH-next] MEMCG: memcontrol: make local symbol static
Message-Id: <20180118150805.18521-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: hannes@cmpxchg.org, mhocko@kernel.org, vdavydov.dev@gmail.com
Cc: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

mm/memcontrol.c:1097:14: warning:
  symbol 'memcg1_stats' was not declared. Should it be static?

Signed-off-by: Christopher D=C3=ADaz Riveros <chrisadr@gentoo.org>
---
 mm/memcontrol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c3d1eaef752d..396674fd97ef 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1094,7 +1094,7 @@ static bool mem_cgroup_wait_acct_move(struct mem_cgro=
up *memcg)
 	return false;
 }
=20
-unsigned int memcg1_stats[] =3D {
+static unsigned int memcg1_stats[] =3D {
 	MEMCG_CACHE,
 	MEMCG_RSS,
 	MEMCG_RSS_HUGE,
--=20
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
