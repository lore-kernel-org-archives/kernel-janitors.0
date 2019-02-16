From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 01:35:43 +0000
Subject: [PATCH -next] misc: fastrpc: Fix return value check in fastrpc_map_create()
Message-Id: <20190216013543.117431-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function dma_buf_get() returns ERR_PTR() and never
returns NULL. The NULL test in the return value check should be replaced
with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 4b0db33896df..7edceaa6adaa 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -496,8 +496,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	map->fl = fl;
 	map->fd = fd;
 	map->buf = dma_buf_get(fd);
-	if (!map->buf) {
-		err = -EINVAL;
+	if (IS_ERR(map->buf)) {
+		err = PTR_ERR(map->buf);
 		goto get_err;
 	}
 
