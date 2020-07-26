From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 15:47:35 +0000
Subject: [PATCH] PCI: correct flag name
Message-Id: <1595778455-12132-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

RESOURCE_IO does not exist.  Rename to IORESOURCE_IO.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
Just a guess based on the most similar name...

 Documentation/filesystems/sysfs-pci.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/sysfs-pci.rst b/Documentation/filesystems/sysfs-pci.rst
index a265f3e..742fbd2 100644
--- a/Documentation/filesystems/sysfs-pci.rst
+++ b/Documentation/filesystems/sysfs-pci.rst
@@ -63,7 +63,7 @@ files, each with their own function.
   binary - file contains binary data
   cpumask - file contains a cpumask type
 
-.. [1] rw for RESOURCE_IO (I/O port) regions only
+.. [1] rw for IORESOURCE_IO (I/O port) regions only
 
 The read only files are informational, writes to them will be ignored, with
 the exception of the 'rom' file.  Writable files can be used to perform
