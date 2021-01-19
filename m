From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 19 Jan 2021 09:53:26 +0000
Subject: [PATCH] arch/Kconfig: update a broken file reference
Message-Id: <20210119095326.13896-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
added the config HAVE_64BIT_ALIGNED_ACCESS back into arch/Kconfig with this
revert. In the meantime, commit c9b54d6f362c ("docs: move other kAPI
documents to core-api") changed ./Documentation/unaligned-memory-access.txt
to ./Documentation/core-api/unaligned-memory-access.rst.

Fortunately, ./scripts/documentation-file-ref-check detects this and warns
about this broken reference.

Update the file reference in arch/Kconfig.

Fixes: adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20210118

Steven, could you pick this fix to your commit or, at least, ack it so that
Jonathan can pick it?

 arch/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 24862d15f3a3..dc104b8270c0 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -156,8 +156,8 @@ config HAVE_64BIT_ALIGNED_ACCESS
 	  accesses are required to be 64 bit aligned in this way even
 	  though it is not a 64 bit architecture.
 
-	  See Documentation/unaligned-memory-access.txt for more
-	  information on the topic of unaligned memory accesses.
+	  See Documentation/core-api/unaligned-memory-access.rst for
+	  more information on the topic of unaligned memory accesses.
 
 config HAVE_EFFICIENT_UNALIGNED_ACCESS
 	bool
-- 
2.17.1
