From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jun 2020 08:11:06 +0000
Subject: [PATCH] topology: mark a function as __init to save some memory
Message-Id: <20200621081106.881915-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'topology_sysfs_init()' is only called via 'device_initcall'.
It can be marked as __init to save a few bytes of memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/base/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index 4e033d4cc0dc..ad8d33c6077b 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -133,7 +133,7 @@ static int topology_remove_dev(unsigned int cpu)
 	return 0;
 }
 
-static int topology_sysfs_init(void)
+static int __init topology_sysfs_init(void)
 {
 	return cpuhp_setup_state(CPUHP_TOPOLOGY_PREPARE,
 				 "base/topology:prepare", topology_add_dev,
-- 
2.25.1
