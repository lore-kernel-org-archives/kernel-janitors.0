From: Chen Gang <gang.chen@asianux.com>
Date: Mon, 27 May 2013 09:55:13 +0000
Subject: [PATCH v2] arch: s390: appldata: using strncpy() and strnlen() instead of sprintf()
Message-Id: <51A32D81.2010105@asianux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A2CC07.5010100@asianux.com> <CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
In-Reply-To: <CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, jang@linux.vnet.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>


'buf[2]' is 2 bytes length, and sprintf() will append '\0' at the end
of string "?\n", so original implementation is memory overflow.

Need use strncpy() and strnlen() instead of sprintf().


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/s390/appldata/appldata_base.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
index bae0f40..87a2209 100644
--- a/arch/s390/appldata/appldata_base.c
+++ b/arch/s390/appldata/appldata_base.c
@@ -212,7 +212,9 @@ appldata_timer_handler(ctl_table *ctl, int write,
 		return 0;
 	}
 	if (!write) {
-		len = sprintf(buf, appldata_timer_active ? "1\n" : "0\n");
+		strncpy(buf, appldata_timer_active ? "1\n" : "0\n",
+			ARRAY_SIZE(buf));
+		len = strnlen(buf, ARRAY_SIZE(buf));
 		if (len > *lenp)
 			len = *lenp;
 		if (copy_to_user(buffer, buf, len))
@@ -317,7 +319,8 @@ appldata_generic_handler(ctl_table *ctl, int write,
 		return 0;
 	}
 	if (!write) {
-		len = sprintf(buf, ops->active ? "1\n" : "0\n");
+		strncpy(buf, ops->active ? "1\n" : "0\n", ARRAY_SIZE(buf));
+		len = strnlen(buf, ARRAY_SIZE(buf));
 		if (len > *lenp)
 			len = *lenp;
 		if (copy_to_user(buffer, buf, len)) {
-- 
1.7.7.6
