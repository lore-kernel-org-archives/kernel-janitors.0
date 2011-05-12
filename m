From: mfmooney@gmail.com
Date: Thu, 12 May 2011 18:25:15 +0000
Subject: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: matt mooney <mfm@muteddisk.com>

Specify --git-dir and --work-tree when building perf targets to
allow out-of-tree builds using O=<build-dir>.

The cat command had to be changed to allow proper file name expansion
of the files listed in MANIFEST.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
Hi Michal,

Sorry if you have already received this, but there seems to have been
a problem when it was first sent.

Thanks,
matt

 scripts/package/Makefile |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 1b7eaea..a32dc2d 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -118,10 +118,14 @@ perf-tar=perf-$(KERNELVERSION)
 
 quiet_cmd_perf_tar = TAR
       cmd_perf_tar = \
-git archive --prefix=$(perf-tar)/ HEAD^{tree}                       \
-	$$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar;  \
+git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \
+	archive --prefix=$(perf-tar)/ HEAD^{tree}                   \
+	$(addprefix $(srctree)/,                                    \
+	  $(shell cat $(srctree)/tools/perf/MANIFEST))              \
+	-o $(perf-tar).tar;                                         \
 mkdir -p $(perf-tar);                                               \
-git rev-parse HEAD > $(perf-tar)/HEAD;                              \
+git --git-dir=$(srctree)/.git --work-tree=$(srctree)                \
+	rev-parse HEAD > $(perf-tar)/HEAD;                          \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD;                            \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-- 
1.7.4.4

