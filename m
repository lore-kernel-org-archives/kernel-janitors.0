From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 04:01:51 +0000
Subject: [PATCH 3/5] staging: dgrp: remove redundant NULL check before unregister_dgrp_device().
Message-Id: <1360641713-24895-4-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>, gregkh@linuxfoundation.org, wfp5p@virginia.edu, tt.rantala@gmail.com, jslaby@suse.cz, sfr@canb.auug.org.au, devel@driverdev.osuosl.org


unregister_dgrp_device on a NULL pointer is a no-op, so the NULL checks in
dgrp_remove_nd() can be removed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/dgrp/dgrp_specproc.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/dgrp/dgrp_specproc.c b/drivers/staging/dgrp/dgrp_specproc.c
index dfdaede..13c7ccf 100644
--- a/drivers/staging/dgrp/dgrp_specproc.c
+++ b/drivers/staging/dgrp/dgrp_specproc.c
@@ -777,14 +777,11 @@ static int dgrp_remove_nd(struct nd_struct *nd)
 		dgrp_remove_node_class_sysfs_files(nd);
 	}
 
-	if (nd->nd_mon_de)
-		unregister_dgrp_device(nd->nd_mon_de);
+	unregister_dgrp_device(nd->nd_mon_de);
 
-	if (nd->nd_ports_de)
-		unregister_dgrp_device(nd->nd_ports_de);
+	unregister_dgrp_device(nd->nd_ports_de);
 
-	if (nd->nd_dpa_de)
-		unregister_dgrp_device(nd->nd_dpa_de);
+	unregister_dgrp_device(nd->nd_dpa_de);
 
 	dgrp_tty_uninit(nd);
 
-- 
1.7.10.4

