From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Nov 2014 18:30:59 +0000
Subject: [patch -next] bpf: null dereference allocating large arrays
Message-Id: <20141122183059.GC6994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here, "array" is null so we can't dereference it and
also the size calculation should match the kzalloc() on the lines
before.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
index 58b80c1..662a412 100644
--- a/kernel/bpf/arraymap.c
+++ b/kernel/bpf/arraymap.c
@@ -38,7 +38,7 @@ static struct bpf_map *array_map_alloc(union bpf_attr *attr)
 	array = kzalloc(sizeof(*array) + attr->max_entries * elem_size,
 			GFP_USER | __GFP_NOWARN);
 	if (!array) {
-		array = vzalloc(array->map.max_entries * array->elem_size);
+		array = vzalloc(sizeof(*array) + attr->max_entries * elem_size);
 		if (!array)
 			return ERR_PTR(-ENOMEM);
 	}
