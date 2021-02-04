From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 04 Feb 2021 18:00:55 +0000
Subject: [PATCH 1/5] fs: turn some comments into kernel-doc
Message-Id: <20210204180059.28360-2-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210204180059.28360-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian.brauner@ubuntu.com>, linux-fsdevel@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

While reviewing ./include/linux/fs.h, I noticed that three comments can
actually be turned into kernel-doc comments. This allows to check the
consistency between the descriptions and the functions' signatures in
case they may change in the future.

A quick validation with the consistency check:

  ./scripts/kernel-doc -none include/linux/fs.h

currently reports no issues in this file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 include/linux/fs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3482146b11b0..04b6b142dfcf 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1739,7 +1739,7 @@ static inline void sb_start_pagefault(struct super_block *sb)
 	__sb_start_write(sb, SB_FREEZE_PAGEFAULT);
 }
 
-/*
+/**
  * sb_start_intwrite - get write access to a superblock for internal fs purposes
  * @sb: the super we write to
  *
@@ -3162,7 +3162,7 @@ static inline ssize_t blockdev_direct_IO(struct kiocb *iocb,
 
 void inode_dio_wait(struct inode *inode);
 
-/*
+/**
  * inode_dio_begin - signal start of a direct I/O requests
  * @inode: inode the direct I/O happens on
  *
@@ -3174,7 +3174,7 @@ static inline void inode_dio_begin(struct inode *inode)
 	atomic_inc(&inode->i_dio_count);
 }
 
-/*
+/**
  * inode_dio_end - signal finish of a direct I/O requests
  * @inode: inode the direct I/O happens on
  *
-- 
2.17.1
