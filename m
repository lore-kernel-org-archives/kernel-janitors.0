From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 29 Aug 2008 19:01:21 +0000
Subject: [PATCH] proc: fix sparse warning: make function grab_header static
Message-Id: <48bad4bb.0aaa660a.7eb7.ffff80b2@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following sparse warning in fs/proc/proc_sysctl.c, by making
the function grab_header static.

warning: symbol 'grab_header' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/proc/proc_sysctl.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index f9a8b89..84f58e8 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -66,7 +66,7 @@ static struct ctl_table *find_in_table(struct ctl_table *p, struct qstr *name)
 	return NULL;
 }
 
-struct ctl_table_header *grab_header(struct inode *inode)
+static struct ctl_table_header *grab_header(struct inode *inode)
 {
 	if (PROC_I(inode)->sysctl)
 		return sysctl_head_grab(PROC_I(inode)->sysctl);
