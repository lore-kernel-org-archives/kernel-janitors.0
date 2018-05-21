From: Sabin Mihai Rapan <sabin.rapan@gmail.com>
Date: Mon, 21 May 2018 17:34:27 +0000
Subject: [PATCH 1/4] staging: lustre: Fix "from from"->"from"
Message-Id: <20180521173430.9759-1-sabin.rapan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180520124408.GA10692@kroah.com>
In-Reply-To: <20180520124408.GA10692@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jsimmons@infradead.org, andreas.dilger@intel.com, oleg.drokin@intel.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sabin Mihai Rapan <sabin.rapan@gmail.com>

Trivial fix to spelling mistake in README.txt

Signed-off-by: Sabin Mihai Rapan <sabin.rapan@gmail.com>
---
 drivers/staging/lustre/README.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.17.0

