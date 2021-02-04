From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:57 +0000
Subject: [PATCH 3/5] fs: update kernel-doc for may_create_in_sticky()
Message-Id: <20210204180059.28360-4-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")
refactors may_create_in_sticky(), adds kernel-doc for the new argument,
but missed to drop the kernel-doc for the removed arguments.

Hence, make htmldocs warns on ./fs/namei.c:1149:

  warning: Excess function parameter 'dir_mode' description in 'may_create_in_sticky'
  warning: Excess function parameter 'dir_uid' description in 'may_create_in_sticky'

Drop removed arguments from kernel-doc of may_create_in_sticky().

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 fs/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 98ea56ebcaf0..64a841dfbb3e 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1121,8 +1121,6 @@ int may_linkat(struct user_namespace *mnt_userns, struct path *link)
  *			  should be allowed, or not, on files that already
  *			  exist.
  * @mnt_userns:	user namespace of the mount the inode was found from
- * @dir_mode: mode bits of directory
- * @dir_uid: owner of directory
  * @inode: the inode of the file to open
  *
  * Block an O_CREAT open of a FIFO (or a regular file) when:
-- 
2.17.1
