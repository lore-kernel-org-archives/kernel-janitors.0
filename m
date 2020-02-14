From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 14 Feb 2020 06:30:03 +0000
Subject: [PATCH] ACPICA: Fix a typo in acuuid.h
Message-Id: <20200214063003.29741-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@rjwysocki.net, lenb@kernel.org, robert.moore@intel.com, erik.kaneda@intel.com
Cc: linux-acpi@vger.kernel.org, devel@acpica.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The comment related to the ending of the include guard should be related to
__ACUUID_H__, not __AUUID_H__ (i.e. 'C' is missing).

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/acpi/acuuid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/acpi/acuuid.h b/include/acpi/acuuid.h
index 9dd4689a39cf..9e1367b19069 100644
--- a/include/acpi/acuuid.h
+++ b/include/acpi/acuuid.h
@@ -57,4 +57,4 @@
 #define UUID_THERMAL_EXTENSIONS         "14d399cd-7a27-4b18-8fb4-7cb7b9f4e500"
 #define UUID_DEVICE_PROPERTIES          "daffd814-6eba-4d8c-8a91-bc9bbf4aa301"
 
-#endif				/* __AUUID_H__ */
+#endif				/* __ACUUID_H__ */
-- 
2.20.1
