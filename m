From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Date: Thu, 07 Feb 2019 16:40:57 +0000
Subject: [PATCH 2/4] scripts: mkdebian: allow renaming generated debian/rules
Message-Id: <1549557659-19137-3-git-send-email-info@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1549557659-19137-1-git-send-email-info@metux.net>
In-Reply-To: <1549557659-19137-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net

Add new environment variable KDEB_RULES for controlling where the
generated debian rules are written to. By defaults, it's debian/rules,
but packagers might override it for providing their own rules file.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index edcad61..ff226be 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -99,6 +99,9 @@ kernel_headers_packagename=3Dlinux-headers-$version
 dbg_packagename=3D$packagename-dbg
 debarch set_debarch
+if [ -z "$KDEB_RULES" ]; then
+    KDEB_RULES=DEbian/rules
+fi
=20
 if [ "$ARCH" =3D "um" ] ; then
 	packagename=3Duser-mode-linux-$version
@@ -202,7 +205,7 @@ Description: Linux kernel debugging symbols for $version
  all the necessary debug symbols for the kernel and its modules.
 EOF
=20
-cat <<EOF > debian/rules
+cat <<EOF > $KDEB_RULES
 #!$(command -v $MAKE) -f
=20
 build:
--=20
1.9.1
