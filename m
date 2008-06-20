From: Andre Haupt <andre@bitwigglers.org>
Date: Fri, 20 Jun 2008 12:51:44 +0000
Subject: [PATCH 1/2] parport: remove superfluous local variable.
Message-Id: <15ef717cf17bfbbcdd49599ed9c99cc655b610fa.1213965527.git.andre@bitwigglers.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1213965527.git.andre@bitwigglers.org>
In-Reply-To: <cover.1213965527.git.andre@bitwigglers.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andre Haupt <andre@bitwigglers.org>

Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/parport/ieee1284.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/parport/ieee1284.c b/drivers/parport/ieee1284.c
index 0338b09..e970594 100644
--- a/drivers/parport/ieee1284.c
+++ b/drivers/parport/ieee1284.c
@@ -199,8 +199,6 @@ int parport_wait_peripheral(struct parport *port,
 	/* 40ms of slow polling. */
 	deadline = jiffies + msecs_to_jiffies(40);
 	while (time_before (jiffies, deadline)) {
-		int ret;
-
 		if (signal_pending (current))
 			return -EINTR;
 
-- 
1.5.5.GIT

