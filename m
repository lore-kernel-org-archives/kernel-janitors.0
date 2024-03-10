Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB47816FF43
	for <kernel-janitors@vger.kernel.org>; Sun, 10 Mar 2024 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710087660; cv=none; b=JwMacDpvU4Y//Ybuf6te04rFjCArpn/SeH+dYK3YsIq6hZOHJpD9Gt7/g2wD0V0dyaulH9U1W48vq1Cva8nQvWsP/IdvJY9B7wwOxCQNodr5V2MzcpVX9TgEn1cu4OZhuTQJGbYsqBSRniGJMykHzknifdSkr3U6Abjir9s78t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710087660; c=relaxed/simple;
	bh=H/ERMdxRZgif1YJjlln1siCzO3C4zNY/tYb9SV+i2iA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QcSLFtJeA7tEiKiE3TIeadL1mVwxF9izwZEKhjEAeDLmLBlm0ripjtOXyU8rMVdx866wRULnl0LX1Dt60wJX+nHlsZ/wsH9t7LTcb51jX9EtMil9AHT9gcW6q9k3NpWYRovgRyTdb3bauQ/cHVxppVXaBJ0X+Dz+2RDuK7bIWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=qficNoLl; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="qficNoLl"
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id jLttrAANWxtdHjLttr6yeJ; Sun, 10 Mar 2024 17:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1710087590;
	bh=rXUTIQg24bJuU6dk3QojcqSr+hAPwOurGASti1sp4RU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=qficNoLlTmRbC98KhpXz+06bJl9S27dmuS7XfY7h1metUQ4MceNL+uNpnNZWcG9qh
	 q/rHPjrRbOHfy/ncsfrwXdbslrSt3OJfUrHrMQMmlibMRiDQO55/L4k4tum5G5/iCw
	 zWWi72iaKXlA3pR1PCROofbT5RGAI0k9T8YJmD6s1a6q+Pgo9MiiL/yGwlxA1VKsLM
	 nuk+Q8lBlSGrAmftbRp45/n0z340Bszj73CfPpmrafbQ8+DR9ejt0jvu/TlQ2hw31e
	 CkwjU/Vt/1Il8+mA66GMTU5TMysUOYV/7BBag1AKh/hH+ULrUzGVWKh9bn251XXjRA
	 /mPgFgWV+vm3g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Mar 2024 17:19:50 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: Remove cat_printf()
Date: Sun, 10 Mar 2024 17:19:44 +0100
Message-ID: <abf3d0361ea291468d121062207a766b0c3228f2.1710087556.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cat_printf() implements the newly introduced seq_buf API.
Use the latter to save some line of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only, with DWC2_PRINT_SCHEDULE defined.
---
 drivers/usb/dwc2/hcd_queue.c | 52 ++++++------------------------------
 1 file changed, 8 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 0d4495c6b9f7..238c6fd50e75 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
 
@@ -359,41 +360,6 @@ static unsigned long *dwc2_get_ls_map(struct dwc2_hsotg *hsotg,
 }
 
 #ifdef DWC2_PRINT_SCHEDULE
-/*
- * cat_printf() - A printf() + strcat() helper
- *
- * This is useful for concatenating a bunch of strings where each string is
- * constructed using printf.
- *
- * @buf:   The destination buffer; will be updated to point after the printed
- *         data.
- * @size:  The number of bytes in the buffer (includes space for '\0').
- * @fmt:   The format for printf.
- * @...:   The args for printf.
- */
-static __printf(3, 4)
-void cat_printf(char **buf, size_t *size, const char *fmt, ...)
-{
-	va_list args;
-	int i;
-
-	if (*size == 0)
-		return;
-
-	va_start(args, fmt);
-	i = vsnprintf(*buf, *size, fmt, args);
-	va_end(args);
-
-	if (i >= *size) {
-		(*buf)[*size - 1] = '\0';
-		*buf += *size;
-		*size = 0;
-	} else {
-		*buf += i;
-		*size -= i;
-	}
-}
-
 /*
  * pmap_print() - Print the given periodic map
  *
@@ -416,9 +382,7 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 	int period;
 
 	for (period = 0; period < periods_in_map; period++) {
-		char tmp[64];
-		char *buf = tmp;
-		size_t buf_size = sizeof(tmp);
+		DECLARE_SEQ_BUF(buf, 64);
 		int period_start = period * bits_per_period;
 		int period_end = period_start + bits_per_period;
 		int start = 0;
@@ -442,19 +406,19 @@ static void pmap_print(unsigned long *map, int bits_per_period,
 				continue;
 
 			if (!printed)
-				cat_printf(&buf, &buf_size, "%s %d: ",
-					   period_name, period);
+				seq_buf_printf(&buf, "%s %d: ",
+					       period_name, period);
 			else
-				cat_printf(&buf, &buf_size, ", ");
+				seq_buf_puts(&buf, ", ");
 			printed = true;
 
-			cat_printf(&buf, &buf_size, "%d %s -%3d %s", start,
-				   units, start + count - 1, units);
+			seq_buf_printf(&buf, "%d %s -%3d %s", start,
+				       units, start + count - 1, units);
 			count = 0;
 		}
 
 		if (printed)
-			print_fn(tmp, print_data);
+			print_fn(seq_buf_str(&buf), print_data);
 	}
 }
 
-- 
2.44.0

