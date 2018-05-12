From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Sat, 12 May 2018 11:01:53 +0000
Subject: [PATCH 1/2] staging: lustre: Fix spelling mistakes
Message-Id: <20180512110153.6797-1-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jsimmons@infradead.org, andreas.dilger@intel.com, leg.drokin@intel.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistakes in TODO and README.txt

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 drivers/staging/lustre/README.txt | 2 +-
 drivers/staging/lustre/TODO       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/README.txt b/drivers/staging/lustre/README.txt
index 0676243eea9e..783959240490 100644
--- a/drivers/staging/lustre/README.txt
+++ b/drivers/staging/lustre/README.txt
@@ -4,7 +4,7 @@ Lustre Parallel Filesystem Client
 The Lustre file system is an open-source, parallel file system
 that supports many requirements of leadership class HPC simulation
 environments.
-Born from from a research project at Carnegie Mellon University,
+Born from a research project at Carnegie Mellon University,
 the Lustre file system is a widely-used option in HPC.
 The Lustre file system provides a POSIX compliant file system interface,
 can scale to thousands of clients, petabytes of storage and
diff --git a/drivers/staging/lustre/TODO b/drivers/staging/lustre/TODO
index 94446487748a..5332cdb19bfa 100644
--- a/drivers/staging/lustre/TODO
+++ b/drivers/staging/lustre/TODO
@@ -12,7 +12,7 @@ addressed:
 * https://jira.hpdd.intel.com/browse/LU-9859
 *
 * Track all the cleanups and simplification of the libcfs module. Remove
-* functions the kernel provides. Possible intergrate some of the functionality
+* functions the kernel provides. Possibly integrate some of the functionality
 * into the kernel proper.
 *
 ******************************************************************************
-- 
2.17.0

