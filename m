From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2014 19:57:31 +0000
Subject: [patch 2/2] staging/bcm: integer underflow leads to Oom
Message-Id: <20140217195731.GB32630@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We do:

        if (NOB > DEFAULT_BUFF_SIZE)
                BuffSize = DEFAULT_BUFF_SIZE;
        else
                BuffSize = NOB;

Since NOB can be negative it results in a larger than intended BuffSize
and makes kzalloc() fail.

The code is still a bit crap because it lets the users read as much as
they want from nvram, but I don't know what a sensible upper limit
should be.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 6f1997dc44c8..5e4dfe031040 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -1894,7 +1894,7 @@ static int bcm_char_ioctl_nvm_raw_read(void __user *argp, struct bcm_mini_adapte
 {
 	struct bcm_nvm_readwrite stNVMRead;
 	struct bcm_ioctl_buffer IoBuffer;
-	INT NOB;
+	unsigned int NOB;
 	INT BuffSize;
 	INT ReadOffset = 0;
 	UINT ReadBytes = 0;
