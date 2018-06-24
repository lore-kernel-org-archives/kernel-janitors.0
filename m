From: Colin King <colin.king@canonical.com>
Date: Sun, 24 Jun 2018 18:25:36 +0000
Subject: [PATCH] mm, swap: make swap_slots_cache_mutex and swap_slots_cache_enable_mutex static
Message-Id: <20180624182536.4937-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The mutexes swap_slots_cache_mutex and swap_slots_cache_enable_mutex are
local to the source and do not need to be in global scope, so make them
static.

Cleans up sparse warnings:
symbol 'swap_slots_cache_mutex' was not declared. Should it be static?
symbol 'swap_slots_cache_enable_mutex' was not declared. Should it be
static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/swap_slots.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swap_slots.c b/mm/swap_slots.c
index a791411fed71..008ccb22fee6 100644
--- a/mm/swap_slots.c
+++ b/mm/swap_slots.c
@@ -38,9 +38,9 @@ static DEFINE_PER_CPU(struct swap_slots_cache, swp_slots);
 static bool	swap_slot_cache_active;
 bool	swap_slot_cache_enabled;
 static bool	swap_slot_cache_initialized;
-DEFINE_MUTEX(swap_slots_cache_mutex);
+static DEFINE_MUTEX(swap_slots_cache_mutex);
 /* Serialize swap slots cache enable/disable operations */
-DEFINE_MUTEX(swap_slots_cache_enable_mutex);
+static DEFINE_MUTEX(swap_slots_cache_enable_mutex);
 
 static void __drain_swap_slots_cache(unsigned int type);
 static void deactivate_swap_slots_cache(void);
-- 
2.17.0

