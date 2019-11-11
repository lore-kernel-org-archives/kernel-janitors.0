From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Nov 2019 09:12:36 +0000
Subject: [PATCH][next] kselftest: arm64: fix spelling mistake "contiguos" -> "contiguous"
Message-Id: <20191111091236.37165-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Dave Martin <Dave.Martin@arm.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index e3521949b800..61ebcdf63831 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -43,7 +43,7 @@ bool validate_extra_context(struct extra_context *extra, char **err)
 	else if (extra->size & 0x0fUL)
 		*err = "Extra SIZE misaligned";
 	else if (extra->datap != (uint64_t)term + sizeof(*term))
-		*err = "Extra DATAP misplaced (not contiguos)";
+		*err = "Extra DATAP misplaced (not contiguous)";
 	if (*err)
 		return false;
 
-- 
2.20.1
