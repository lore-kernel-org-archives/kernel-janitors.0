From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 17:25:49 +0000
Subject: [PATCH] Documentation: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026172549.3628-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/filesystems/spufs.txt | 2 +-
 Documentation/gpu/drm-uapi.rst      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/spufs.txt b/Documentation/filesystems/spufs.txt
index 1343d118a9b2..eb9e3aa63026 100644
--- a/Documentation/filesystems/spufs.txt
+++ b/Documentation/filesystems/spufs.txt
@@ -452,7 +452,7 @@ RETURN VALUE
 
 
 ERRORS
-       EACCESS
+       EACCES
               The  current  user does not have write access on the spufs mount
               point.
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index a2214cc1f821..f2f079e91b4c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -190,11 +190,11 @@ ENOSPC:
 
         Simply running out of kernel/system memory is signalled through ENOMEM.
 
-EPERM/EACCESS:
+EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
         this when when called by unpriviledged clients. There's no clear
-        difference between EACCESS and EPERM.
+        difference between EACCES and EPERM.
 
 ENODEV:
         Feature (like PRIME, modesetting, GEM) is not supported by the driver.
-- 
2.19.1
