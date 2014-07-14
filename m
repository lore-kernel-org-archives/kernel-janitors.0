From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Mon, 14 Jul 2014 22:56:21 +0000
Subject: [PATCH] drivers/platform/x86/thinkpad_acpi.c: don't test unsigned int for negativity
Message-Id: <1405378581-12146-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br
Cc: matthew.garrett@nebula.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80231
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index d82f196..4d59b09 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6144,7 +6144,7 @@ static int brightness_set(unsigned int value)
 {
 	int res;
=20
-	if (value > bright_maxlvl || value < 0)
+	if (value > bright_maxlvl)
 		return -EINVAL;
=20
 	vdbg_printk(TPACPI_DBG_BRGHT,
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
