From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 13 Jan 2021 07:05:57 +0000
Subject: [PATCH for doc-next] doc/zh_CN: mips: use doc references instead
Message-Id: <20210113070557.28792-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Yanteng Si <siyanteng@loongson.cn>, Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The Chinese mips translations refer to non-existing labels in the original
documentation. Hence, make htmldocs warns about those undefined labels on
all files in ./Documentation/translations/zh_CN/mips/.

Replace the references to non-existing labels with suitable doc references.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210113

Yanteng, please ack.

Jonathan, please pick this doc warning fixup on your -next tree. 

 Documentation/translations/zh_CN/mips/booting.rst     | 2 +-
 Documentation/translations/zh_CN/mips/features.rst    | 2 +-
 Documentation/translations/zh_CN/mips/index.rst       | 2 +-
 Documentation/translations/zh_CN/mips/ingenic-tcu.rst | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/mips/booting.rst b/Documentation/translations/zh_CN/mips/booting.rst
index 3099d0fff7a6..96453e1b962e 100644
--- a/Documentation/translations/zh_CN/mips/booting.rst
+++ b/Documentation/translations/zh_CN/mips/booting.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/mips/booting.rst <booting>`
+:Original: :doc:`../../../mips/booting`
 :Translator: Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_booting:
diff --git a/Documentation/translations/zh_CN/mips/features.rst b/Documentation/translations/zh_CN/mips/features.rst
index 7e67f81a0982..93d93d06b1b3 100644
--- a/Documentation/translations/zh_CN/mips/features.rst
+++ b/Documentation/translations/zh_CN/mips/features.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/mips/features.rst <features>`
+:Original: :doc:`../../../mips/features`
 :Translator: Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_features:
diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
index 2c7b836a3da5..27a2eae8484a 100644
--- a/Documentation/translations/zh_CN/mips/index.rst
+++ b/Documentation/translations/zh_CN/mips/index.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/mips/index.rst <index>`
+:Original: :doc:`../../../mips/index`
 :Translator: Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_index:
diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
index 9324a0a26430..f04ba407384a 100644
--- a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/mips/ingenic-tcu.rst <ingenic-tcu>`
+:Original: :doc:`../../../mips/ingenic-tcu`
 :Translator: Yanteng Si <siyanteng@loongson.cn>
 
 .. _cn_ingenic-tcu:
-- 
2.17.1
