From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 11:24:51 +0000
Subject: [PATCH] staging: greybus: fix spelling mistake "entires" -> "entries"
Message-Id: <20180914112451.4127-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/greybus/tools/README.loopback | 2 +-
 drivers/staging/greybus/tools/loopback_test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/tools/README.loopback b/drivers/staging/greybus/tools/README.loopback
index 845b08dc4696..070a510cbe7c 100644
--- a/drivers/staging/greybus/tools/README.loopback
+++ b/drivers/staging/greybus/tools/README.loopback
@@ -79,7 +79,7 @@ Here is the summary of the available options:
    -t     must be one of the test names - sink, transfer or ping
    -i     iteration count - the number of iterations to run the test over
  Optional arguments
-   -S     sysfs location - location for greybus 'endo' entires default /sys/bus/greybus/devices/
+   -S     sysfs location - location for greybus 'endo' entries default /sys/bus/greybus/devices/
    -D     debugfs location - location for loopback debugfs entries default /sys/kernel/debug/gb_loopback/
    -s     size of data packet to send during test - defaults to zero
    -m     mask - a bit mask of connections to include example: -m 8 = 4th connection -m 9 = 1st and 4th connection etc
diff --git a/drivers/staging/greybus/tools/loopback_test.c b/drivers/staging/greybus/tools/loopback_test.c
index b82e2befe935..2fa88092514d 100644
--- a/drivers/staging/greybus/tools/loopback_test.c
+++ b/drivers/staging/greybus/tools/loopback_test.c
@@ -192,7 +192,7 @@ void usage(void)
 	"   -t     must be one of the test names - sink, transfer or ping\n"
 	"   -i     iteration count - the number of iterations to run the test over\n"
 	" Optional arguments\n"
-	"   -S     sysfs location - location for greybus 'endo' entires default /sys/bus/greybus/devices/\n"
+	"   -S     sysfs location - location for greybus 'endo' entries default /sys/bus/greybus/devices/\n"
 	"   -D     debugfs location - location for loopback debugfs entries default /sys/kernel/debug/gb_loopback/\n"
 	"   -s     size of data packet to send during test - defaults to zero\n"
 	"   -m     mask - a bit mask of connections to include example: -m 8 = 4th connection -m 9 = 1st and 4th connection etc\n"
-- 
2.17.1
