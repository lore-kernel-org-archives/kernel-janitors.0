From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 12:02:22 +0000
Subject: [patch] nfs: fix unlikely memory leak
Message-Id: <20100306120221.GA10702@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'll admit that it's unlikely for the first allocation to fail and 
the second one to succeed.  I won't be offended if you ignore this
patch.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index eda74c4..f9254fb 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -5107,6 +5107,7 @@ static int nfs41_proc_async_sequence(struct nfs_client *clp,
 	res = kzalloc(sizeof(*res), GFP_KERNEL);
 	if (!args || !res) {
 		kfree(args);
+		kfree(res);
 		nfs_put_client(clp);
 		return -ENOMEM;
 	}
