From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Oct 2017 12:53:47 +0000
Subject: [PATCH net] selftests/net: rxtimestamp: Fix an off by one
Message-Id: <20171005125347.otplfss4mo7hfopv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Mike Maloney <maloney@google.com>
Cc: Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= so that we don't write one element beyond the end of
the array.

Fixes: 16e781224198 ("selftests/net: Add a test to validate behavior of rx timestamps")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/testing/selftests/networking/timestamping/rxtimestamp.c b/tools/testing/selftests/networking/timestamping/rxtimestamp.c
index 00f286661dcd..dd4162fc0419 100644
--- a/tools/testing/selftests/networking/timestamping/rxtimestamp.c
+++ b/tools/testing/selftests/networking/timestamping/rxtimestamp.c
@@ -341,7 +341,7 @@ int main(int argc, char **argv)
 			return 0;
 		case 'n':
 			t = atoi(optarg);
-			if (t > ARRAY_SIZE(test_cases))
+			if (t >= ARRAY_SIZE(test_cases))
 				error(1, 0, "Invalid test case: %d", t);
 			all_tests = false;
 			test_cases[t].enabled = true;
