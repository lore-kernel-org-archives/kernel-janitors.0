From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 29 Aug 2012 16:49:13 +0000
Subject: [PATCH 3/7] logfs: fix error return code
Message-Id: <1346258957-7649-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346258957-7649-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joern Engel <joern@logfs.org>
Cc: kernel-janitors@vger.kernel.org, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Initialize return variable before exiting on an error path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/logfs/segment.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/logfs/segment.c b/fs/logfs/segment.c
index 038da09..0cf91e4 100644
--- a/fs/logfs/segment.c
+++ b/fs/logfs/segment.c
@@ -601,6 +601,7 @@ static int __logfs_segment_read(struct inode *inode, void *buf,
 					"%llx: expected %x, got %x\n", ofs,
 					be32_to_cpu(oh.data_crc),
 					be32_to_cpu(crc));
+			err = -EIO;
 			goto out_err;
 		}
 		break;
@@ -619,6 +620,7 @@ static int __logfs_segment_read(struct inode *inode, void *buf,
 					be32_to_cpu(oh.data_crc),
 					be32_to_cpu(crc));
 			mutex_unlock(&logfs_super(sb)->s_journal_mutex);
+			err = -EIO;
 			goto out_err;
 		}
 		err = logfs_uncompress(compressor_buf, buf, len, block_len);

