From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 07:00:21 +0000
Subject: [PATCH] selftests/bpf: signedness bug in enable_all_controllers()
Message-Id: <20190613070021.GG16334@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Roman Gushchin <guro@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

The "len" variable needs to be signed for the error handling to work
properly.

Fixes: 596092ef8bea ("selftests/bpf: enable all available cgroup v2 controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/testing/selftests/bpf/cgroup_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/cgroup_helpers.c b/tools/testing/selftests/bpf/cgroup_helpers.c
index 0d89f0396be4..e95c33e333a4 100644
--- a/tools/testing/selftests/bpf/cgroup_helpers.c
+++ b/tools/testing/selftests/bpf/cgroup_helpers.c
@@ -47,7 +47,7 @@ int enable_all_controllers(char *cgroup_path)
 	char buf[PATH_MAX];
 	char *c, *c2;
 	int fd, cfd;
-	size_t len;
+	ssize_t len;
 
 	snprintf(path, sizeof(path), "%s/cgroup.controllers", cgroup_path);
 	fd = open(path, O_RDONLY);
-- 
2.20.1
