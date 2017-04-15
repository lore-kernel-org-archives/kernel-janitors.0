From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Apr 2017 19:22:14 +0000
Subject: [PATCH] ringtest: fix an assert statement
Message-Id: <20170415192214.GB6416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

There is an || vs && typo so the assert can never be triggered.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/virtio/ringtest/main.c b/tools/virtio/ringtest/main.c
index 022ae95a06bd..453ca3c21193 100644
--- a/tools/virtio/ringtest/main.c
+++ b/tools/virtio/ringtest/main.c
@@ -87,7 +87,7 @@ void set_affinity(const char *arg)
 	cpu = strtol(arg, &endptr, 0);
 	assert(!*endptr);
 
-	assert(cpu >= 0 || cpu < CPU_SETSIZE);
+	assert(cpu >= 0 && cpu < CPU_SETSIZE);
 
 	self = pthread_self();
 	CPU_ZERO(&cpuset);
