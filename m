From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:55:06 +0000
Subject: [PATCH 2/7] fs/ext{2,3,4}: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171854270.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sct@redhat.com, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

 fs/ext2/balloc.c |    3 +--
 fs/ext2/dir.c    |    3 +--
 fs/ext3/balloc.c |    3 +--
 fs/ext4/balloc.c |    3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/fs/ext2/balloc.c b/fs/ext2/balloc.c
--- a/fs/ext2/balloc.c 2008-02-10 22:34:14.000000000 +0100
+++ b/fs/ext2/balloc.c 2008-02-17 16:39:35.000000000 +0100
@@ -245,8 +245,7 @@ restart:
 		prev = rsv;
 	}
 	printk("Window map complete.\n");
-	if (bad)
-		BUG();
+	BUG_ON(bad);
 }
 #define rsv_window_dump(root, verbose) \
 	__rsv_window_dump((root), (verbose), __FUNCTION__)
diff -u -p a/fs/ext2/dir.c b/fs/ext2/dir.c
--- a/fs/ext2/dir.c 2008-02-10 22:34:14.000000000 +0100
+++ b/fs/ext2/dir.c 2008-02-17 16:39:36.000000000 +0100
@@ -41,8 +41,8 @@ static inline __le16 ext2_rec_len_to_dis
 {
 	if (len = (1 << 16))
 		return cpu_to_le16(EXT2_MAX_REC_LEN);
-	else if (len > (1 << 16))
-		BUG();
+	else
+		BUG_ON(len > (1 << 16));
 	return cpu_to_le16(len);
 }
 
diff -u -p a/fs/ext3/balloc.c b/fs/ext3/balloc.c
--- a/fs/ext3/balloc.c 2008-02-10 22:34:14.000000000 +0100
+++ b/fs/ext3/balloc.c 2008-02-17 16:39:38.000000000 +0100
@@ -232,8 +232,7 @@ restart:
 		prev = rsv;
 	}
 	printk("Window map complete.\n");
-	if (bad)
-		BUG();
+	BUG_ON(bad);
 }
 #define rsv_window_dump(root, verbose) \
 	__rsv_window_dump((root), (verbose), __FUNCTION__)
diff -u -p a/fs/ext4/balloc.c b/fs/ext4/balloc.c
--- a/fs/ext4/balloc.c 2008-02-10 22:34:14.000000000 +0100
+++ b/fs/ext4/balloc.c 2008-02-17 16:39:39.000000000 +0100
@@ -356,8 +356,7 @@ restart:
 		prev = rsv;
 	}
 	printk("Window map complete.\n");
-	if (bad)
-		BUG();
+	BUG_ON(bad);
 }
 #define rsv_window_dump(root, verbose) \
 	__rsv_window_dump((root), (verbose), __FUNCTION__)
