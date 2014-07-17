From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:55:07 +0000
Subject: [PATCH 3/4] drivers/misc/sgi-gru/grukdump.c: drop negativity check for unsgined req.gid
Message-Id: <1405605307-13657-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: sivanich@sgi.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/misc/sgi-gru/grukdump.c:199]: (style) Checking if
unsigned variable 'gid' is less than zero.

    if (req.gid >=3D gru_max_gids || req.gid < 0)
        return -EINVAL;

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80461
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/misc/sgi-gru/grukdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/sgi-gru/grukdump.c b/drivers/misc/sgi-gru/grukdum=
p.c
index a3700a5..e0e0e7e 100644
--- a/drivers/misc/sgi-gru/grukdump.c
+++ b/drivers/misc/sgi-gru/grukdump.c
@@ -196,7 +196,7 @@ int gru_dump_chiplet_request(unsigned long arg)
 		return -EFAULT;
=20
 	/* Currently, only dump by gid is implemented */
-	if (req.gid >=3D gru_max_gids || req.gid < 0)
+	if (req.gid >=3D gru_max_gids)
 		return -EINVAL;
=20
 	gru =3D GID_TO_GRU(req.gid);
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
