From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:52:43 +0000
Subject: [patch] x86/pkeys: seftests: off by one in sigsafe_printf()
Message-Id: <20161013085243.GF16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We want "len" to represent the number of characters printed not counting
the NUL terminator.  At most there will be "DPRINT_IN_SIGNAL_BUF_SIZE - 1"
characters printed.

Fixes: 5f23f6d082a9 ("x86/pkeys: Add self-tests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/testing/selftests/x86/pkey-helpers.h b/tools/testing/selftests/x86/pkey-helpers.h
index b202939..1f21661 100644
--- a/tools/testing/selftests/x86/pkey-helpers.h
+++ b/tools/testing/selftests/x86/pkey-helpers.h
@@ -36,8 +36,8 @@ static inline void sigsafe_printf(const char *format, ...)
 		 * len is amount that would have been printed,
 		 * but actual write is truncated at BUF_SIZE.
 		 */
-		if (len > DPRINT_IN_SIGNAL_BUF_SIZE)
-			len = DPRINT_IN_SIGNAL_BUF_SIZE;
+		if (len >= DPRINT_IN_SIGNAL_BUF_SIZE)
+			len = DPRINT_IN_SIGNAL_BUF_SIZE - 1;
 		write(1, dprint_in_signal_buffer, len);
 	}
 	va_end(ap);
