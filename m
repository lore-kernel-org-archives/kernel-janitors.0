From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Mar 2020 09:38:53 +0000
Subject: [PATCH] perf vendor events: fix spelling mistakes: "occurences" -> "occurrences"
Message-Id: <20200316093853.117752-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427185206.16347-1-colin.king@canonical.com>
In-Reply-To: <20180427185206.16347-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Andi Kleen <ak@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix spelling mistake of "occurrences"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/pmu-events/arch/x86/ivybridge/pipeline.json    | 2 +-
 tools/perf/pmu-events/arch/x86/ivytown/pipeline.json      | 2 +-
 tools/perf/pmu-events/arch/x86/jaketown/pipeline.json     | 2 +-
 .../perf/pmu-events/arch/x86/knightslanding/pipeline.json | 8 ++++----
 tools/perf/pmu-events/arch/x86/sandybridge/pipeline.json  | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/ivybridge/pipeline.json b/tools/perf/pmu-events/arch/x86/ivybridge/pipeline.json
index 2a0aad91d83d..e5ca2d85e84d 100644
--- a/tools/perf/pmu-events/arch/x86/ivybridge/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/ivybridge/pipeline.json
@@ -80,7 +80,7 @@
         "EdgeDetect": "1",
         "EventName": "INT_MISC.RECOVERY_STALLS_COUNT",
         "SampleAfterValue": "2000003",
-        "BriefDescription": "Number of occurences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc.)",
+        "BriefDescription": "Number of occurrences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc.)",
         "CounterMask": "1",
         "CounterHTOff": "0,1,2,3,4,5,6,7"
     },
diff --git a/tools/perf/pmu-events/arch/x86/ivytown/pipeline.json b/tools/perf/pmu-events/arch/x86/ivytown/pipeline.json
index 2a0aad91d83d..e5ca2d85e84d 100644
--- a/tools/perf/pmu-events/arch/x86/ivytown/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/ivytown/pipeline.json
@@ -80,7 +80,7 @@
         "EdgeDetect": "1",
         "EventName": "INT_MISC.RECOVERY_STALLS_COUNT",
         "SampleAfterValue": "2000003",
-        "BriefDescription": "Number of occurences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc.)",
+        "BriefDescription": "Number of occurrences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc.)",
         "CounterMask": "1",
         "CounterHTOff": "0,1,2,3,4,5,6,7"
     },
diff --git a/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json b/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
index 783a5b4a67b1..f32fd4aea6b1 100644
--- a/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/jaketown/pipeline.json
@@ -1019,7 +1019,7 @@
         "EdgeDetect": "1",
         "EventName": "INT_MISC.RECOVERY_STALLS_COUNT",
         "SampleAfterValue": "2000003",
-        "BriefDescription": "Number of occurences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc...).",
+        "BriefDescription": "Number of occurrences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc...).",
         "CounterMask": "1",
         "CounterHTOff": "0,1,2,3,4,5,6,7"
     },
diff --git a/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json b/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
index 92e4ef2e22c6..17c92cdedde0 100644
--- a/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/knightslanding/pipeline.json
@@ -340,7 +340,7 @@
         "UMask": "0x1",
         "EventName": "RECYCLEQ.LD_BLOCK_ST_FORWARD",
         "SampleAfterValue": "200003",
-        "BriefDescription": "Counts the number of occurences a retired load gets blocked because its address partially overlaps with a store",
+        "BriefDescription": "Counts the number of occurrences a retired load gets blocked because its address partially overlaps with a store",
         "Data_LA": "1"
     },
     {
@@ -349,7 +349,7 @@
         "UMask": "0x2",
         "EventName": "RECYCLEQ.LD_BLOCK_STD_NOTREADY",
         "SampleAfterValue": "200003",
-        "BriefDescription": "Counts the number of occurences a retired load gets blocked because its address overlaps with a store whose data is not ready"
+        "BriefDescription": "Counts the number of occurrences a retired load gets blocked because its address overlaps with a store whose data is not ready"
     },
     {
         "PublicDescription": "This event counts the number of retired store that experienced a cache line boundary split(Precise Event). Note that each spilt should be counted only once.",
@@ -358,7 +358,7 @@
         "UMask": "0x4",
         "EventName": "RECYCLEQ.ST_SPLITS",
         "SampleAfterValue": "200003",
-        "BriefDescription": "Counts the number of occurences a retired store that is a cache line split. Each split should be counted only once."
+        "BriefDescription": "Counts the number of occurrences a retired store that is a cache line split. Each split should be counted only once."
     },
     {
         "PEBS": "1",
@@ -367,7 +367,7 @@
         "UMask": "0x8",
         "EventName": "RECYCLEQ.LD_SPLITS",
         "SampleAfterValue": "200003",
-        "BriefDescription": "Counts the number of occurences a retired load that is a cache line split. Each split should be counted only once.",
+        "BriefDescription": "Counts the number of occurrences a retired load that is a cache line split. Each split should be counted only once.",
         "Data_LA": "1"
     },
     {
diff --git a/tools/perf/pmu-events/arch/x86/sandybridge/pipeline.json b/tools/perf/pmu-events/arch/x86/sandybridge/pipeline.json
index b7150f65f16d..d69db55f33e7 100644
--- a/tools/perf/pmu-events/arch/x86/sandybridge/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/sandybridge/pipeline.json
@@ -108,7 +108,7 @@
         "EdgeDetect": "1",
         "EventName": "INT_MISC.RECOVERY_STALLS_COUNT",
         "SampleAfterValue": "2000003",
-        "BriefDescription": "Number of occurences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc...).",
+        "BriefDescription": "Number of occurrences waiting for the checkpoints in Resource Allocation Table (RAT) to be recovered after Nuke due to all other cases except JEClear (e.g. whenever a ucode assist is needed like SSE exception, memory disambiguation, etc...).",
         "CounterMask": "1",
         "CounterHTOff": "0,1,2,3,4,5,6,7"
     },
-- 
2.25.1
