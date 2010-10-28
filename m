From: Dan Carpenter <error27@gmail.com>
Date: Thu, 28 Oct 2010 04:44:03 +0000
Subject: [patch] nfs: check kmalloc() return
Message-Id: <20101028044403.GV6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The decode_and_add_ds() should return NULL on failure.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
index 51fe64a..098113c 100644
--- a/fs/nfs/nfs4filelayoutdev.c
+++ b/fs/nfs/nfs4filelayoutdev.c
@@ -219,6 +219,8 @@ decode_and_add_ds(__be32 **pp, struct inode *inode)
 		goto out_err;
 	}
 	buf = kmalloc(rlen + 1, GFP_KERNEL);
+	if (!buf)
+		goto out_err;
 	buf[rlen] = '\0';
 	memcpy(buf, r_addr, rlen);
 
