From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 19:00:33 +0000
Subject: [PATCH] ima: Replace two seq_printf() calls by seq_puts() in ima_show_template_data_ascii()
Message-Id: <b0842345-1ab0-b199-91c7-90df51351d74@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96eac40-0745-80b5-6aab-f872e6415031@web.de>
In-Reply-To: <e96eac40-0745-80b5-6aab-f872e6415031@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 20:52:21 +0200

Two strings which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/integrity/ima/ima_template_lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/integrity/ima/ima_template_lib.c b/security/integrity/ima/ima_template_lib.c
index 9fe0ef7f91e2..05636e9b19b1 100644
--- a/security/integrity/ima/ima_template_lib.c
+++ b/security/integrity/ima/ima_template_lib.c
@@ -74,7 +74,7 @@ static void ima_show_template_data_ascii(struct seq_file *m,
 	case DATA_FMT_DIGEST_WITH_ALGO:
 		buf_ptr = strnchr(field_data->data, buflen, ':');
 		if (buf_ptr != field_data->data)
-			seq_printf(m, "%s", field_data->data);
+			seq_puts(m, field_data->data);

 		/* skip ':' and '\0' */
 		buf_ptr += 2;
@@ -87,7 +87,7 @@ static void ima_show_template_data_ascii(struct seq_file *m,
 		ima_print_digest(m, buf_ptr, buflen);
 		break;
 	case DATA_FMT_STRING:
-		seq_printf(m, "%s", buf_ptr);
+		seq_puts(m, buf_ptr);
 		break;
 	default:
 		break;
--
2.22.0
