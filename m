From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 18 Sep 2014 20:24:01 +0000
Subject: [PATCH] Use kzalloc and rewrite null tests
Message-Id: <1411071842-24714-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

The following patch removes some kzalloc-related macros and rewrites the
associated null tests to use !x rather than x = NULL.  The complete
semantic patch used for this transformation is as follows:

// <smpl>
@disable unlikely@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (unlikely(
+     !
      ptr
-      = NULL
     )) S else S1

@@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (
+     !
      ptr
-      = NULL
     ) S else S1

@disable unlikely@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (likely(
      ptr
-      != NULL
     )) S else S1

@@
expression ptr;
statement S,S1;
@@

  \(OBD_ALLOC\|OBD_ALLOC_WAIT\|OBD_ALLOC_PTR\|OBD_ALLOC_PTR_WAIT\)(ptr,...);
  if (
      ptr
-      != NULL
     ) S else S1

// -----------------------------------------------------------------------

@@
expression ptr,size;
@@

- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_ALLOC_WAIT(ptr,size)
+ ptr = kzalloc(size, GFP_KERNEL)

@@
expression ptr,size;
@@

- OBD_ALLOC_PTR(ptr)
+ ptr = kzalloc(sizeof(*ptr), GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_ALLOC_PTR_WAIT(ptr,size)
+ ptr = kzalloc(sizeof(*ptr), GFP_KERNEL)
// </smpl>

