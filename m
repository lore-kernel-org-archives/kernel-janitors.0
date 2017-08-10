From: Colin King <colin.king@canonical.com>
Date: Thu, 10 Aug 2017 16:04:10 +0000
Subject: [PATCH] perf/x86/intel/p4: make array p4_event_aliases static
Message-Id: <20170810160410.7291-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array p4_event_aliases is local to the source and do not need to be in
global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'p4_event_aliases' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/p4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/events/intel/p4.c b/arch/x86/events/intel/p4.c
index eb0533558c2b..d32c0eed38ca 100644
--- a/arch/x86/events/intel/p4.c
+++ b/arch/x86/events/intel/p4.c
@@ -587,7 +587,7 @@ static __initconst const u64 p4_hw_cache_event_ids
  * P4_CONFIG_ALIASABLE or bits for P4_PEBS_METRIC, they are
  * either up to date automatically or not applicable at all.
  */
-struct p4_event_alias {
+static struct p4_event_alias {
 	u64 original;
 	u64 alternative;
 } p4_event_aliases[] = {
-- 
2.11.0

