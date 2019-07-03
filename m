From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jul 2019 08:00:35 +0000
Subject: [PATCH] media: cobalt: remove redundant assignment to variable data
Message-Id: <20190703080035.13975-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable data is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cobalt/cobalt-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-flash.c b/drivers/media/pci/cobalt/cobalt-flash.c
index ef96e0f956d2..1d3c64b4cf6d 100644
--- a/drivers/media/pci/cobalt/cobalt-flash.c
+++ b/drivers/media/pci/cobalt/cobalt-flash.c
@@ -69,7 +69,7 @@ static void flash_copy_to(struct map_info *map, unsigned long to,
 
 	pr_info("%s: offset 0x%x: length %zu\n", __func__, dest, len);
 	while (len) {
-		u16 data = 0xffff;
+		u16 data;
 
 		do {
 			data = *src << (8 * (dest & 1));
-- 
2.20.1
