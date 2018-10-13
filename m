From: Colin King <colin.king@canonical.com>
Date: Sat, 13 Oct 2018 15:41:05 +0000
Subject: [PATCH] kvm: selftests: fix spelling mistake "Insufficent" -> "Insufficient"
Message-Id: <20181013154105.5999-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in TEST_ASSERT message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 6fd8c089cafc..a56ef6b187bb 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -123,7 +123,7 @@ struct kvm_vm *vm_create(enum vm_guest_mode mode, uint64_t phy_pages, int perm)
 
 	/* Allocate memory. */
 	vm = calloc(1, sizeof(*vm));
-	TEST_ASSERT(vm != NULL, "Insufficent Memory");
+	TEST_ASSERT(vm != NULL, "Insufficient Memory");
 
 	vm->mode = mode;
 	vm_open(vm, perm);
-- 
2.17.1
