From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Sep 2012 07:02:51 +0000
Subject: [patch 2/3] remoteproc: snprintf() can return more than was printed
Message-Id: <20120925070251.GC23009@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

snprintf() returns the number of characters which would have been
printed if there were enough space.  For example, on the first print if
we fill up the 28 character string then it would return a number more
than 30.  Use scnprintf() instead because that returns the actual number
of characters printed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 10a3825..ea90a56 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -82,7 +82,7 @@ static ssize_t rproc_state_read(struct file *filp, char __user *userbuf,
 
 	state = rproc->state > RPROC_LAST ? RPROC_LAST : rproc->state;
 
-	i = snprintf(buf, 30, "%.28s (%d)\n", rproc_state_string[state],
+	i = scnprintf(buf, 30, "%.28s (%d)\n", rproc_state_string[state],
 							rproc->state);
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
@@ -103,7 +103,7 @@ static ssize_t rproc_name_read(struct file *filp, char __user *userbuf,
 	char buf[100];
 	int i;
 
-	i = snprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
+	i = scnprintf(buf, sizeof(buf), "%.98s\n", rproc->name);
 
 	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
 }
