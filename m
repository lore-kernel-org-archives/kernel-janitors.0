From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 03 Jul 2019 15:11:28 +0000
Subject: [PATCH 3/3] NFS: Three function calls less
Message-Id: <fd43c523-ceef-ed2d-0e98-1c792350d9ed@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
In-Reply-To: <cb79bcb1-0fd6-1b7f-c131-5883f09ad105@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 Jul 2019 16:45:25 +0200

Reduce function calls in two function implementations.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/nfs/nfs4xdr.c |  5 +----
 fs/nfs/super.c   | 23 +++++++++++------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index 602446158bfb..03d58a4e38de 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -1006,10 +1006,7 @@ static size_t mask_bitmap4(const __u32 *bitmap, const __u32 *mask,
 static void encode_nfs4_seqid(struct xdr_stream *xdr,
 		const struct nfs_seqid *seqid)
 {
-	if (seqid != NULL)
-		encode_uint32(xdr, seqid->sequence->counter);
-	else
-		encode_uint32(xdr, 0);
+	encode_uint32(xdr, seqid ? seqid->sequence->counter : 0);
 }

 static void encode_compound_hdr(struct xdr_stream *xdr,
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 84dcde7f560b..88d0be7959b5 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -663,12 +663,12 @@ static void nfs_show_mount_options(struct seq_file *m, struct nfs_server *nfss,
 		seq_printf(m, ",acdirmax=%u", nfss->acdirmax/HZ);
 	if (!(nfss->flags & (NFS_MOUNT_SOFT|NFS_MOUNT_SOFTERR)))
 			seq_puts(m, ",hard");
-	for (nfs_infop = nfs_info; nfs_infop->flag; nfs_infop++) {
-		if (nfss->flags & nfs_infop->flag)
-			seq_puts(m, nfs_infop->str);
-		else
-			seq_puts(m, nfs_infop->nostr);
-	}
+	for (nfs_infop = nfs_info; nfs_infop->flag; nfs_infop++)
+		seq_puts(m,
+			 (nfss->flags & nfs_infop->flag)
+			 ? nfs_infop->str
+			 : nfs_infop->nostr);
+
 	rcu_read_lock();
 	seq_printf(m, ",proto=%s",
 		   rpc_peeraddr2str(nfss->client, RPC_DISPLAY_NETID));
@@ -695,12 +695,11 @@ static void nfs_show_mount_options(struct seq_file *m, struct nfs_server *nfss,
 	if (nfss->options & NFS_OPTION_MIGRATION)
 		seq_puts(m, ",migration");

-	if (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONEG) {
-		if (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONE)
-			seq_puts(m, ",lookupcache=none");
-		else
-			seq_puts(m, ",lookupcache=pos");
-	}
+	if (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONEG)
+		seq_puts(m,
+			 (nfss->flags & NFS_MOUNT_LOOKUP_CACHE_NONE)
+			 ? ",lookupcache=none"
+			 : ",lookupcache=pos");

 	local_flock = nfss->flags & NFS_MOUNT_LOCAL_FLOCK;
 	local_fcntl = nfss->flags & NFS_MOUNT_LOCAL_FCNTL;
--
2.22.0
