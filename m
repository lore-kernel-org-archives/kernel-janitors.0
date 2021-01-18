From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Jan 2021 11:19:02 +0000
Subject: [PATCH][next] selftests: forwarding: Fix spelling mistake "succeded" -> "succeeded"
Message-Id: <20210118111902.71096-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in check_fail messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/net/forwarding/tc_chains.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/tc_chains.sh b/tools/testing/selftests/net/forwarding/tc_chains.sh
index 2934fb5ed2a2..b95de0463ebd 100755
--- a/tools/testing/selftests/net/forwarding/tc_chains.sh
+++ b/tools/testing/selftests/net/forwarding/tc_chains.sh
@@ -136,7 +136,7 @@ template_filter_fits()
 
 	tc filter add dev $h2 ingress protocol ip pref 1 handle 1102 \
 		flower src_mac $h2mac action drop &> /dev/null
-	check_fail $? "Incorrectly succeded to insert filter which does not template"
+	check_fail $? "Incorrectly succeeded to insert filter which does not template"
 
 	tc filter add dev $h2 ingress chain 1 protocol ip pref 1 handle 1101 \
 		flower src_mac $h2mac action drop
@@ -144,7 +144,7 @@ template_filter_fits()
 
 	tc filter add dev $h2 ingress chain 1 protocol ip pref 1 handle 1102 \
 		flower dst_mac $h2mac action drop &> /dev/null
-	check_fail $? "Incorrectly succeded to insert filter which does not template"
+	check_fail $? "Incorrectly succeeded to insert filter which does not template"
 
 	tc filter del dev $h2 ingress chain 1 protocol ip pref 1 handle 1102 \
 		flower &> /dev/null
-- 
2.29.2
