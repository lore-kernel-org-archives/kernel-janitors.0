From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:54 +0000
Subject: [PATCH 0/5] kernel-doc fixes to latest fs changes
Message-Id: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

this patchset was motivated by new warnings with make htmldocs appearing on
linux-next in the last week.

Please apply this on top of your latest work in fs on top of the mount user
namespace refactoring, cf. the commits referred in the individual commit
messages.


Lukas Bulwahn (5):
  fs: turn some comments into kernel-doc
  fs: update kernel-doc for vfs_rename()
  fs: update kernel-doc for may_create_in_sticky()
  fs: update kernel-doc for vfs_tmpfile()
  fs: update kernel-doc for new mnt_userns argument

 fs/libfs.c         |  1 +
 fs/namei.c         | 13 ++-----------
 fs/xattr.c         |  2 ++
 include/linux/fs.h | 17 ++++++++++++++---
 4 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.17.1
