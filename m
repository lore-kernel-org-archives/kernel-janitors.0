From: mfmooney@gmail.com
Date: Fri, 13 May 2011 23:41:12 +0000
Subject: [PATCH v3] package: Makefile: fix perf target bug
Message-Id: <b07e7ecdce48bc90a2cf83e8867494dae7cd174f.1305329845.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4DCD8CE4.4090404@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: matt mooney <mfm@muteddisk.com>

Specify --git-dir when building perf targets to allow out-of-tree
builds using O=<build-dir>.

The shell command in `git archive' had to be modified to allow proper
file name expansion of the files listed in MANIFEST.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 scripts/package/Makefile |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 1b7eaea..03df8ee 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -118,10 +118,12 @@ perf-tar=perf-$(KERNELVERSION)
 
 quiet_cmd_perf_tar = TAR
       cmd_perf_tar = \
-git archive --prefix=$(perf-tar)/ HEAD^{tree}                       \
-	$$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar;  \
+git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
+	HEAD^{tree} $$(cd $(srctree);                               \
+		       echo $$(cat $(srctree)/tools/perf/MANIFEST)) \
+	-o $(perf-tar).tar;                                         \
 mkdir -p $(perf-tar);                                               \
-git rev-parse HEAD > $(perf-tar)/HEAD;                              \
+git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD;                            \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-- 
1.7.4.4

