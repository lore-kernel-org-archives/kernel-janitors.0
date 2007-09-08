From: richard@nod.at (Richard Weinberger)
Date: Sat, 08 Sep 2007 23:03:11 +0000
Subject: [PATCH] trivial - filemap.c - comparison of unsigned expression
Message-Id: <20070908230311.B5D7BE3C3D@raccoon.haslach.nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"if (likely(copied >= 0))" is always true because "copied" is defined as size_t.

Signed-off-by: Richard Weinberger <richard@nod.at>

diff --git a/mm/filemap.c b/mm/filemap.c
index 90b657b..8e93057 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1939,24 +1939,22 @@ generic_file_buffered_write(struct kiocb *iocb, const struct iovec *iov,
 			continue;
 		}
 zero_length_segment:
-		if (likely(copied >= 0)) {
-			if (!status)
-				status = copied;
-
-			if (status >= 0) {
-				written += status;
-				count -= status;
-				pos += status;
-				buf += status;
-				if (unlikely(nr_segs > 1)) {
-					filemap_set_next_iovec(&cur_iov,
-							&iov_base, status);
-					if (count)
-						buf = cur_iov->iov_base +
-							iov_base;
-				} else {
-					iov_base += status;
-				}
+		if (!status)
+			status = copied;
+
+		if (status >= 0) {
+			written += status;
+			count -= status;
+			pos += status;
+			buf += status;
+			if (unlikely(nr_segs > 1)) {
+				filemap_set_next_iovec(&cur_iov,
+						&iov_base, status);
+				if (count)
+					buf = cur_iov->iov_base +
+						iov_base;
+			} else {
+				iov_base += status;
 			}
 		}
 		if (unlikely(copied != bytes))

