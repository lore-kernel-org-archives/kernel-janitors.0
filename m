From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Aug 2017 12:45:10 +0000
Subject: [PATCH] stm: Potential read overflow in stm_char_policy_set_ioctl()
Message-Id: <20170810122250.desrz5rvyjheyltg@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "size" variable comes from the user so we need to verify that it's
large enough to hold an stp_policy_id struct.

Fixes: 7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 0e731143f6a4..9414900575d8 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -566,7 +566,7 @@ static int stm_char_policy_set_ioctl(struct stm_file *stmf, void __user *arg)
 	if (copy_from_user(&size, arg, sizeof(size)))
 		return -EFAULT;
 
-	if (size >= PATH_MAX + sizeof(*id))
+	if (size < sizeof(*id) || size >= PATH_MAX + sizeof(*id))
 		return -EINVAL;
 
 	/*
