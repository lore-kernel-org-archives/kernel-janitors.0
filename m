From: "Andrew F. Davis" <afd@ti.com>
Date: Mon, 12 Jun 2017 14:42:46 +0000
Subject: [PATCH] DocBook: w1: Update W1 file locations and names in DocBook
Message-Id: <20170612144246.15557-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170612142932.GA31457@kroah.com>
In-Reply-To: <20170612142932.GA31457@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Sebastian Reichel <sre@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Some of the files in the W1 subsystem have been moved or renamed,
update the documentation for the same.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/DocBook/w1.tmpl | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/DocBook/w1.tmpl b/Documentation/DocBook/w1.tmpl
index b0228d4c81bb..c65cb27abef9 100644
--- a/Documentation/DocBook/w1.tmpl
+++ b/Documentation/DocBook/w1.tmpl
@@ -51,9 +51,9 @@
     <sect1 id="w1_internal_api">
       <title>W1 API internal to the kernel</title>
       <sect2 id="w1.h">
-        <title>drivers/w1/w1.h</title>
-        <para>W1 core functions.</para>
-!Idrivers/w1/w1.h
+        <title>include/linux/w1.h</title>
+        <para>W1 kernel API functions.</para>
+!Iinclude/linux/w1.h
       </sect2>
 
       <sect2 id="w1.c">
@@ -62,18 +62,18 @@
 !Idrivers/w1/w1.c
       </sect2>
 
-      <sect2 id="w1_family.h">
-        <title>drivers/w1/w1_family.h</title>
-        <para>Allows registering device family operations.</para>
-!Idrivers/w1/w1_family.h
-      </sect2>
-
       <sect2 id="w1_family.c">
         <title>drivers/w1/w1_family.c</title>
         <para>Allows registering device family operations.</para>
 !Edrivers/w1/w1_family.c
       </sect2>
 
+      <sect2 id="w1_internal.h">
+        <title>drivers/w1/w1_internal.h</title>
+        <para>W1 internal initialization for master devices.</para>
+!Idrivers/w1/w1_internal.h
+      </sect2>
+
       <sect2 id="w1_int.c">
         <title>drivers/w1/w1_int.c</title>
         <para>W1 internal initialization for master devices.</para>
-- 
2.13.0

