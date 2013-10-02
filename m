From: Sagar Padhye <sgr.m.pdy@gmail.com>
Date: Wed, 02 Oct 2013 18:59:04 +0000
Subject: [PATCH] FIXED sparse warning : drivers/cpuidle/cpuidle.c:27:1: warning: symbol 'cpuidle_dev' was not
Message-Id: <1380739624-17257-1-git-send-email-sgr.m.pdy@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

---
This is the first patch I am sending out, hope this is ok. I checked that cpuidle_devices is only being used in cpuidle.c - hence thought that it can be made static and be removed from header.

 drivers/cpuidle/cpuidle.c | 4 ++--
 include/linux/cpuidle.h   | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index d75040d..4826506 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -23,8 +23,8 @@
 
 #include "cpuidle.h"
 
-DEFINE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
-DEFINE_PER_CPU(struct cpuidle_device, cpuidle_dev);
+static DEFINE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
+static DEFINE_PER_CPU(struct cpuidle_device, cpuidle_dev);
 
 DEFINE_MUTEX(cpuidle_lock);
 LIST_HEAD(cpuidle_detected_devices);
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index 781addc..96c8ed8 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -83,7 +83,6 @@ struct cpuidle_device {
 #endif
 };
 
-DECLARE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
 
 /**
  * cpuidle_get_last_residency - retrieves the last state's residency time
-- 
1.8.1.2

