From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:00:48 +0000
Subject: [PATCH] KVM: selftests: delete some dead code
Message-Id: <20200605110048.GB978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, Ben Gardon <bgardon@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org

The "uffd_delay" variable is unsigned so it's always going to be >= 0.

Fixes: 0119cb365c93 ("KVM: selftests: Add configurable demand paging delay")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 360cd3ea4cd67..4eb79621434e6 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -615,8 +615,6 @@ int main(int argc, char *argv[])
 			break;
 		case 'd':
 			uffd_delay = strtoul(optarg, NULL, 0);
-			TEST_ASSERT(uffd_delay >= 0,
-				    "A negative UFFD delay is not supported.");
 			break;
 		case 'b':
 			vcpu_memory_bytes = parse_size(optarg);
-- 
2.26.2
