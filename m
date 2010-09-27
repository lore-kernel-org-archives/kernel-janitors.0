From: matt mooney <mfm@muteddisk.com>
Date: Mon, 27 Sep 2010 02:11:12 +0000
Subject: [PATCH] kbuild: remove duplicate -I flag in addtree
Message-Id: <1285553472-924-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

When O= is used, any -I flag given that is not an absolute path gets
duplicated. The $(1) appended to the conditional clause covers the
absolute case, but due to being outside of the conditional statement
it gets added everytime.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 scripts/Kbuild.include |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ed2773e..08c74ed 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -158,7 +158,7 @@ modbuiltin := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.modbuiltin obj
 # Prefix -I with $(srctree) if it is not an absolute path.
 # skip if -I has no parameter
 addtree = $(if $(patsubst -I%,%,$(1)), \
-$(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1))
+$(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1)),$(1)))
 
 # Find all -I options and call addtree
 flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))
-- 
1.7.2.1

