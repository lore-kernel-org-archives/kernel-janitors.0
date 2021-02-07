From: Colin King <colin.king@canonical.com>
Date: Sun, 07 Feb 2021 22:46:48 +0000
Subject: [PATCH] PM / Domains: Fix integer overflows on u32 bit multiplies
Message-Id: <20210207224648.8137-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Titinger <mtitinger+renesas@baylibre.com>, Lina Iyer <lina.iyer@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are three occurrances of u32 variables being multiplied by
1000 using 32 bit multiplies and the result being assigned to a
64 bit signed integer.  These can potentially lead to a 32 bit
overflows, so fix this by casting 1000 to a UL first to force
a 64 bit multiply hence avoiding the overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 30f604283e05 ("PM / Domains: Allow domain power states to be read from DT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/power/domain.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index aaf6c83b5cf6..ddeff69126ff 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2831,10 +2831,10 @@ static int genpd_parse_state(struct genpd_power_state *genpd_state,
 
 	err = of_property_read_u32(state_node, "min-residency-us", &residency);
 	if (!err)
-		genpd_state->residency_ns = 1000 * residency;
+		genpd_state->residency_ns = 1000UL * residency;
 
-	genpd_state->power_on_latency_ns = 1000 * exit_latency;
-	genpd_state->power_off_latency_ns = 1000 * entry_latency;
+	genpd_state->power_on_latency_ns = 1000UL * exit_latency;
+	genpd_state->power_off_latency_ns = 1000UL * entry_latency;
 	genpd_state->fwnode = &state_node->fwnode;
 
 	return 0;
-- 
2.29.2
