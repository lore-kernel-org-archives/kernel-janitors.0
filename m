From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 09 Nov 2014 09:06:31 +0000
Subject: [PATCH 0/3] remove final uses of the GOTO macro
Message-Id: <1415523994-12520-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Remove final uses of the GOTO macro, and remove the associated macro and
underlying function.

 drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h |   12 
 drivers/staging/lustre/lustre/libcfs/debug.c               |    8 
 drivers/staging/lustre/lustre/osc/osc_cache.c              |  168 ++++++++-----
 3 files changed, 110 insertions(+), 78 deletions(-)
