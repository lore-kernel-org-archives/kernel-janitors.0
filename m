From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jan 2018 10:43:16 +0000
Subject: [PATCH] staging: comedi: dt2811: remove redundant initialization of 'ns'
Message-Id: <20180123104316.31360-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ns is being initialized with a value that is never read, ns
is being re-assigned a new value later on. Remove the redundant
initialization.

Cleans up clang warning:
drivers/staging/comedi/drivers/dt2811.c:310:21: warning: Value stored
to 'ns' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/comedi/drivers/dt2811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/dt2811.c b/drivers/staging/comedi/drivers/dt2811.c
index fea0a1baf10b..05207a519755 100644
--- a/drivers/staging/comedi/drivers/dt2811.c
+++ b/drivers/staging/comedi/drivers/dt2811.c
@@ -307,7 +307,7 @@ static int dt2811_ai_cmd(struct comedi_device *dev,
 static unsigned int dt2811_ns_to_timer(unsigned int *nanosec,
 				       unsigned int flags)
 {
-	unsigned long long ns = *nanosec;
+	unsigned long long ns;
 	unsigned int ns_lo = COMEDI_MIN_SPEED;
 	unsigned int ns_hi = 0;
 	unsigned int divisor_hi = 0;
-- 
2.15.1

