From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 12 Jan 2021 06:39:30 +0000
Subject: [PATCH -next] f2fs: docs: rectify the table header in sysfs-fs-f2fs
Message-Id: <20210112063930.20525-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 969945899a35 ("f2fs: introduce sb_status sysfs node") documents the
sb_status values in a table in ./Documentation/ABI/testing/sysfs-fs-f2fs,
but the table header of the first column has a wrong length.

Hence, make htmldocs warns:

  Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Malformed table.

Rectify the table header.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210112

 Documentation/ABI/testing/sysfs-fs-f2fs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index e5918c93f3bf..362803901614 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -383,7 +383,7 @@ Date:		December 2020
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	Show status of f2fs superblock in real time.
 
-		===  =========== ================+		=== =========== ================ 		value  sb status macro       description
 		0x1    SBI_IS_DIRTY          dirty flag for checkpoint
 		0x2    SBI_IS_CLOSE          specify unmounting
-- 
2.17.1
