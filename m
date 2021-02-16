From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Feb 2021 14:01:12 +0000
Subject: [PATCH][next] tracing/tools: fix spelling mistake "functionph" -> "graph"
Message-Id: <20210216140112.159926-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the -g help option, I believe
it should be "graph". Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/tracing/latency/latency-collector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tracing/latency/latency-collector.c b/tools/tracing/latency/latency-collector.c
index 57b20802e71b..8d28234cd6fb 100644
--- a/tools/tracing/latency/latency-collector.c
+++ b/tools/tracing/latency/latency-collector.c
@@ -1711,7 +1711,7 @@ static void show_usage(void)
 "\t\t\tbeginning, end, and backtrace.\n\n"
 
 "-g, --graph\t\tEnable the display-graph option in trace_option. This\n"
-"\t\t\toption causes ftrace to show the functionph of how\n"
+"\t\t\toption causes ftrace to show the graph of how\n"
 "\t\t\tfunctions are calling other functions.\n\n"
 
 "-c, --policy POL\tRun the program with scheduling policy POL. POL can be\n"
-- 
2.30.0
