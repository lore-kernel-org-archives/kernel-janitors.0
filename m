From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Jan 2021 12:10:53 +0000
Subject: [PATCH][next] powercap/drivers/dtpm: Fix size of object being allocated
Message-Id: <20210104121053.33210-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Lukasz Luba <lukasz.luba@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The kzalloc allocation for dtpm_cpu is currently allocating the size
of the pointer and not the size of the structure. Fix this by using
the correct sizeof argument.

Addresses-Coverity: ("Wrong sizeof argument")
Fixes: 0e8f68d7f048 ("powercap/drivers/dtpm: Add CPU energy model based support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/powercap/dtpm_cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/powercap/dtpm_cpu.c b/drivers/powercap/dtpm_cpu.c
index 6933c783c6b4..51c366938acd 100644
--- a/drivers/powercap/dtpm_cpu.c
+++ b/drivers/powercap/dtpm_cpu.c
@@ -200,7 +200,7 @@ static int cpuhp_dtpm_cpu_online(unsigned int cpu)
 	if (!dtpm)
 		return -EINVAL;
 
-	dtpm_cpu = kzalloc(sizeof(dtpm_cpu), GFP_KERNEL);
+	dtpm_cpu = kzalloc(sizeof(*dtpm_cpu), GFP_KERNEL);
 	if (!dtpm_cpu)
 		goto out_kfree_dtpm;
 
-- 
2.29.2
