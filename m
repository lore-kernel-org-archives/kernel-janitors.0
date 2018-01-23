From: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>
Date: Tue, 23 Jan 2018 20:10:09 +0000
Subject: [PATCH-next] misc: mic: Use PTR_ERR_OR_ZERO
Message-Id: <20180123201009.12998-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk
Cc: =?UTF-8?q?Christopher=20D=C3=ADaz=20Riveros?= <chrisadr@gentoo.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher D=C3=ADaz Riveros <chrisadr@gentoo.org>
---
 drivers/misc/mic/scif/scif_epd.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/mic/scif/scif_epd.h b/drivers/misc/mic/scif/scif_=
epd.h
index f39b663da287..b2a835665390 100644
--- a/drivers/misc/mic/scif/scif_epd.h
+++ b/drivers/misc/mic/scif/scif_epd.h
@@ -165,9 +165,7 @@ static inline int scif_verify_epd(struct scif_endpt *ep)
 static inline int scif_anon_inode_getfile(scif_epd_t epd)
 {
 	epd->anon =3D anon_inode_getfile("scif", &scif_anon_fops, NULL, 0);
-	if (IS_ERR(epd->anon))
-		return PTR_ERR(epd->anon);
-	return 0;
+	return PTR_ERR_OR_ZERO(epd->anon);
 }
=20
 static inline void scif_anon_inode_fput(scif_epd_t epd)
--=20
2.16.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
