From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Oct 2011 05:53:26 +0000
Subject: [patch] memory hotplug: release lock on an error path
Message-Id: <20111005055326.GA32187@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Fontenot <nfont@austin.ibm.com>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org

We need to release the mutex here before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index ca8bfe5..164c8a2 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -299,7 +299,7 @@ static int memory_block_change_state(struct memory_block *mem,
 		for (i = 0; i < sections_per_block; i++) {
 			ret = check_page_reservations(mem->start_section_nr + i);
 			if (ret)
-				return ret;
+				goto out;
 		}
 	}

