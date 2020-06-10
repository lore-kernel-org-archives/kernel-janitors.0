From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 08:59:11 +0000
Subject: [PATCH] virtio-mem: silence a static checker warning
Message-Id: <20200610085911.GC5439@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "rc" can be uninitialized if we hit the "break;"
statement on the first iteration through the loop.  I suspect that this
can't happen in real life, but returning a zero literal is cleaner and
silence the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/virtio/virtio_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index f658fe9149beb..893ef18060a02 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1192,7 +1192,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
 						VIRTIO_MEM_MB_STATE_OFFLINE);
 	}
 
-	return rc;
+	return 0;
 }
 
 /*
-- 
2.26.2
