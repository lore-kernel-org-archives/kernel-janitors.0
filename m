From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 29 Apr 2020 06:52:01 +0000
Subject: [PATCH 0/4 v2] firmware: stratix10-svc: Fix some error handling code
Message-Id: <cover.1588142343.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.gong@linux.intel.com, gregkh@linuxfoundation.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This serie was previously sent as a single patch.
After a comment from Dan Carpenter about an error handling path that could be
improved, I've looked deeper at the code and found other issues.

The previous patch corresponds to patch 3/4 in this serie.
This v2 takes Dan's comment into account and fix another resource leak.

Patch 1/4: svc_create_memory_pool returns an error code on error, not NULL 
Patch 2/4: undo a memremap on error path and remove funtion
Patch 3/4: improve error handling in the probe function
Patch 4/4: unrelated clean-up

Christophe JAILLET (4):
  firmware: stratix10-svc: Fix genpool creation error handling
  firmware: stratix10-svc: Unmap some previously memremap'ed memory
  firmware: stratix10-svc: Fix some error handling paths in
    'stratix10_svc_drv_probe()'
  firmware: stratix10-svc: Slighly simplify call

 drivers/firmware/stratix10-svc.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

-- 
2.25.1
