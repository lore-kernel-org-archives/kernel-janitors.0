From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:34:58 +0000
Subject: [PATCH 5/11] kernel/sysctl.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-6-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Al Viro <viro@zeniv.linux.org.uk>, Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 kernel/sysctl.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/kernel/sysctl.c b/kernel/sysctl.c
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1600,8 +1600,7 @@ void sysctl_head_put(struct ctl_table_he
 
 struct ctl_table_header *sysctl_head_grab(struct ctl_table_header *head)
 {
-	if (!head)
-		BUG();
+	BUG_ON(!head);
 	spin_lock(&sysctl_lock);
 	if (!use_table(head))
 		head = ERR_PTR(-ENOENT);

