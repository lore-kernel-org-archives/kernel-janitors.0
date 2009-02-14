From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:48:44 +0000
Subject: [PATCH 37/43] drivers/net/wireless: fix sparse warning: context
Message-Id: <20090214214833.24377.6182.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Attribute function with __acquires(...) resp. __releases(...).

Fix this sparse warnings:
  drivers/net/wireless/strip.c:955:21: warning: context imbalance in 'strip_seq_start' - wrong count at exit
  drivers/net/wireless/strip.c:975:13: warning: context imbalance in 'strip_seq_stop' - unexpected unlock

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/strip.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/strip.c b/drivers/net/wireless/strip.c
index d6bf8d2..39f525e 100644
--- a/drivers/net/wireless/strip.c
+++ b/drivers/net/wireless/strip.c
@@ -950,6 +950,7 @@ static struct strip *strip_get_idx(loff_t pos)
 }
 
 static void *strip_seq_start(struct seq_file *seq, loff_t *pos)
+	__acquires(RCU)
 {
 	rcu_read_lock();
 	return *pos ? strip_get_idx(*pos - 1) : SEQ_START_TOKEN;
@@ -973,6 +974,7 @@ static void *strip_seq_next(struct seq_file *seq, void *v, loff_t *pos)
 }
 
 static void strip_seq_stop(struct seq_file *seq, void *v)
+	__releases(RCU)
 {
 	rcu_read_unlock();
 }

