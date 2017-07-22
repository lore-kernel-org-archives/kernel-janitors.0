From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Jul 2017 07:36:10 +0000
Subject: [PATCH] perf script: remove some bogus error handling
Message-Id: <20170722073610.nnsyiwdcfl6bhn4t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If script_desc__new() fails then the current code has a NULL
dereference.  We don't actually need to do any cleanup, we can just
return NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 83cdc0a61fd6..89ea2bc9b9be 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2199,16 +2199,11 @@ static struct script_desc *script_desc__findnew(const char *name)
 
 	s = script_desc__new(name);
 	if (!s)
-		goto out_delete_desc;
+		return NULL;
 
 	script_desc__add(s);
 
 	return s;
-
-out_delete_desc:
-	script_desc__delete(s);
-
-	return NULL;
 }
 
 static const char *ends_with(const char *str, const char *suffix)
