From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 25 Jan 2021 14:48:47 +0000
Subject: [PATCH] kgdb: rectify kernel-doc for kgdb_unregister_io_module()
Message-Id: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
reported a typo in the kernel-doc of kgdb_unregister_io_module().

Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.11-rc5 and next-20210122

Jason, Daniel, please pick this minor typo fixup.

 kernel/debug/debug_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index af6e8b4fb359..7f22c1c0ffe8 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1166,7 +1166,7 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 EXPORT_SYMBOL_GPL(kgdb_register_io_module);
 
 /**
- *	kkgdb_unregister_io_module - unregister KGDB IO module
+ *	kgdb_unregister_io_module - unregister KGDB IO module
  *	@old_dbg_io_ops: the io ops vector
  *
  *	Unregister it with the KGDB core.
-- 
2.17.1
