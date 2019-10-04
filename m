From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Oct 2019 08:13:42 +0000
Subject: [PATCH] kvm: selftests: fix spelling mistake: missmatch -> mismatch
Message-Id: <20191004081342.22108-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013154105.5999-1-colin.king@canonical.com>
In-Reply-To: <20181013154105.5999-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in in an error message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/kvm/lib/sparsebit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
index 031ba3c932ed..59ffba902e61 100644
--- a/tools/testing/selftests/kvm/lib/sparsebit.c
+++ b/tools/testing/selftests/kvm/lib/sparsebit.c
@@ -1866,7 +1866,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
 		 * of total bits set.
 		 */
 		if (s->num_set != total_bits_set) {
-			fprintf(stderr, "Number of bits set missmatch,\n"
+			fprintf(stderr, "Number of bits set mismatch,\n"
 				"  s->num_set: 0x%lx total_bits_set: 0x%lx",
 				s->num_set, total_bits_set);
 
-- 
2.20.1
