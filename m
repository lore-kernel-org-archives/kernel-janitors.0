From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Aug 2020 12:30:12 +0000
Subject: [PATCH] selftests/net: skip msg_zerocopy test if we have less than 4 CPUs
Message-Id: <20200804123012.378750-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current test will exit with a failure if it cannot set affinity on
specific CPUs which is problematic when running this on single CPU
systems. Add a check for the number of CPUs and skip the test if
the CPU requirement is not met.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/net/msg_zerocopy.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/net/msg_zerocopy.sh b/tools/testing/selftests/net/msg_zerocopy.sh
index 825ffec85cea..97bc527e1297 100755
--- a/tools/testing/selftests/net/msg_zerocopy.sh
+++ b/tools/testing/selftests/net/msg_zerocopy.sh
@@ -21,6 +21,11 @@ readonly DADDR6='fd::2'
 
 readonly path_sysctl_mem="net.core.optmem_max"
 
+if [[ $(nproc) -lt 4 ]]; then
+	echo "SKIP: test requires at least 4 CPUs"
+	exit 4
+fi
+
 # No arguments: automated test
 if [[ "$#" -eq "0" ]]; then
 	$0 4 tcp -t 1
-- 
2.27.0
