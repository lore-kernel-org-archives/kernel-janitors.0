From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Jun 2017 19:18:20 +0000
Subject: [PATCH] mm, vmpressure: free the same pointer we allocated
Message-Id: <20170613191820.GA20003@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>
Cc: Minchan Kim <minchan@kernel.org>, Vinayak Menon <vinmenon@codeaurora.org>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

We keep incrementing "spec" as we parse the args so we end up calling
kfree() on a modified of spec.  It probably works or this would have
been caught in testing, but it looks weird.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/mm/vmpressure.c b/mm/vmpressure.c
index 0781b1363e0a..1225ec5d9596 100644
--- a/mm/vmpressure.c
+++ b/mm/vmpressure.c
@@ -386,11 +386,11 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
 	struct vmpressure_event *ev;
 	enum vmpressure_modes mode = VMPRESSURE_NO_PASSTHROUGH;
 	enum vmpressure_levels level = -1;
-	char *spec = NULL;
+	char *spec, *spec_orig;
 	char *token;
 	int ret = 0;
 
-	spec = kzalloc(MAX_VMPRESSURE_ARGS_LEN + 1, GFP_KERNEL);
+	spec_orig = spec = kzalloc(MAX_VMPRESSURE_ARGS_LEN + 1, GFP_KERNEL);
 	if (!spec) {
 		ret = -ENOMEM;
 		goto out;
@@ -429,7 +429,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
 	list_add(&ev->node, &vmpr->events);
 	mutex_unlock(&vmpr->events_lock);
 out:
-	kfree(spec);
+	kfree(spec_orig);
 	return ret;
 }
 
