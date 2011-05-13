From: mfmooney@gmail.com
Date: Fri, 13 May 2011 00:09:03 +0000
Subject: [PATCH v2] package: Makefile: fix perf target bug
Message-Id: <e5dfdb7d9a9909d6f9faa20c45115142ebce2ae2.1305244842.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
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
Okay, so I decided to just go ahead and send this. It removes the --work-tree
option from the git rev-parse command. I did test it the way you said, without
--work-tree on either statement, but the git archive command fails in that case.

Thanks,
matt

 scripts/package/Makefile |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 1b7eaea..2747f1f 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -118,10 +118,13 @@ perf-tar=perf-$(KERNELVERSION)
 
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
+git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD;                            \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-- 
1.7.4.4

