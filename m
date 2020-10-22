From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Oct 2020 14:26:53 +0000
Subject: [PATCH][next] docs/vm: trivial fixes to several spelling mistakes
Message-Id: <20201022142653.254429-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix several spelling mistakes in vm documentation.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/vm/mmu_notifier.rst   | 2 +-
 Documentation/vm/page_migration.rst | 2 +-
 Documentation/vm/page_owner.rst     | 2 +-
 Documentation/vm/slub.rst           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/vm/mmu_notifier.rst b/Documentation/vm/mmu_notifier.rst
index 47baa1cf28c5..df5d7777fc6b 100644
--- a/Documentation/vm/mmu_notifier.rst
+++ b/Documentation/vm/mmu_notifier.rst
@@ -89,7 +89,7 @@ they are write protected for COW (other case of B apply too).
 
 So here because at time N+2 the clear page table entry was not pair with a
 notification to invalidate the secondary TLB, the device see the new value for
-addrB before seing the new value for addrA. This break total memory ordering
+addrB before seeing the new value for addrA. This break total memory ordering
 for the device.
 
 When changing a pte to write protect or to point to a new write protected page
diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
index 91a98a6b43bb..db9d7e5539cb 100644
--- a/Documentation/vm/page_migration.rst
+++ b/Documentation/vm/page_migration.rst
@@ -99,7 +99,7 @@ Steps:
 2. Ensure that writeback is complete.
 
 3. Lock the new page that we want to move to. It is locked so that accesses to
-   this (not yet uptodate) page immediately block while the move is in progress.
+   this (not yet up-to-date) page immediately block while the move is in progress.
 
 4. All the page table references to the page are converted to migration
    entries. This decreases the mapcount of a page. If the resulting
diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 079f3f8c4784..02deac76673f 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -18,7 +18,7 @@ Although we already have tracepoint for tracing page allocation/free,
 using it for analyzing who allocate each page is rather complex. We need
 to enlarge the trace buffer for preventing overlapping until userspace
 program launched. And, launched program continually dump out the trace
-buffer for later analysis and it would change system behviour with more
+buffer for later analysis and it would change system behaviour with more
 possibility rather than just keeping it in memory, so bad for debugging.
 
 page owner can also be used for various purposes. For example, accurate
diff --git a/Documentation/vm/slub.rst b/Documentation/vm/slub.rst
index 289d231cee97..03f294a638bd 100644
--- a/Documentation/vm/slub.rst
+++ b/Documentation/vm/slub.rst
@@ -378,7 +378,7 @@ c) Execute ``slabinfo-gnuplot.sh`` in '-t' mode, passing all of the
    can go unnoticed. To deal with that, ``slabinfo-gnuplot.sh`` has two
    options to 'zoom-in'/'zoom-out':
 
-   a) ``-s %d,%d`` -- overwrites the default image width and heigh
+   a) ``-s %d,%d`` -- overwrites the default image width and height
    b) ``-r %d,%d`` -- specifies a range of samples to use (for example,
       in ``slabinfo -X >> FOO_STATS; sleep 1;`` case, using a ``-r
       40,60`` range will plot only samples collected between 40th and
-- 
2.27.0
