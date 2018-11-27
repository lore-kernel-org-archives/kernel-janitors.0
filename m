From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Nov 2018 14:23:28 +0000
Subject: [PATCH] staging: comedi: fix spelling mistake "desination" -> "destination"
Message-Id: <20181127142328.27287-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Spencer E . Olson" <olsonse@umich.edu>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in message text in the call to unittest,
fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/tests/ni_routes_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/tests/ni_routes_test.c b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
index a1eda035f270..c6dc18f346e8 100644
--- a/drivers/staging/comedi/drivers/tests/ni_routes_test.c
+++ b/drivers/staging/comedi/drivers/tests/ni_routes_test.c
@@ -372,7 +372,7 @@ void test_ni_lookup_route_register(void)
 	unittest(ni_lookup_route_register(O(8), O(9), T) = 8,
 		 "validate last destination\n");
 	unittest(ni_lookup_route_register(O(10), O(9), T) = -EINVAL,
-		 "lookup invalid desination\n");
+		 "lookup invalid destination\n");
 
 	unittest(ni_lookup_route_register(rgout0_src0, TRIGGER_LINE(0), T) =
 		 -EINVAL,
-- 
2.19.1
