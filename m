From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 12:19:39 +0000
Subject: [PATCH 2/3] char/pcmcia: Improve nine size determinations
Message-Id: <d6796af7-21cb-a6ad-658a-863de4270235@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
In-Reply-To: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 13:33:04 +0200

Replace the specification of data types by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/pcmcia/synclink_cs.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 4db7eda2e7f2..6c210b5cdf69 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -519,7 +519,7 @@ static int mgslpc_probe(struct pcmcia_device *link)
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("mgslpc_attach\n");
 
-	info = kzalloc(sizeof(MGSLPC_INFO), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
@@ -534,7 +534,7 @@ static int mgslpc_probe(struct pcmcia_device *link)
 	init_waitqueue_head(&info->event_wait_q);
 	spin_lock_init(&info->lock);
 	spin_lock_init(&info->netlock);
-	memcpy(&info->params,&default_params,sizeof(MGSL_PARAMS));
+	memcpy(&info->params, &default_params, sizeof(default_params));
 	info->idle_mode = HDLC_TXIDLE_FLAGS;
 	info->imra_value = 0xffff;
 	info->imrb_value = 0xffff;
@@ -1771,7 +1771,8 @@ static int get_stats(MGSLPC_INFO * info, struct mgsl_icount __user *user_icount)
 	if (!user_icount) {
 		memset(&info->icount, 0, sizeof(info->icount));
 	} else {
-		COPY_TO_USER(err, user_icount, &info->icount, sizeof(struct mgsl_icount));
+		COPY_TO_USER(err, user_icount, &info->icount,
+			     sizeof(*user_icount));
 		if (err)
 			return -EFAULT;
 	}
@@ -1785,7 +1786,7 @@ static int get_params(MGSLPC_INFO * info, MGSL_PARAMS __user *user_params)
 	int err;
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("get_params(%s)\n", info->device_name);
-	COPY_TO_USER(err,user_params, &info->params, sizeof(MGSL_PARAMS));
+	COPY_TO_USER(err, user_params, &info->params, sizeof(*user_params));
 	if (err)
 		return -EFAULT;
 	return 0;
@@ -1809,7 +1810,7 @@ static int set_params(MGSLPC_INFO * info, MGSL_PARAMS __user *new_params, struct
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("%s(%d):set_params %s\n", __FILE__,__LINE__,
 			info->device_name);
-	COPY_FROM_USER(err,&tmp_params, new_params, sizeof(MGSL_PARAMS));
+	COPY_FROM_USER(err, &tmp_params, new_params, sizeof(tmp_params));
 	if (err) {
 		if (debug_level >= DEBUG_LEVEL_INFO)
 			printk("%s(%d):set_params(%s) user buffer copy failed\n",
@@ -1818,7 +1819,7 @@ static int set_params(MGSLPC_INFO * info, MGSL_PARAMS __user *new_params, struct
 	}
 
 	spin_lock_irqsave(&info->lock, flags);
-	memcpy(&info->params,&tmp_params,sizeof(MGSL_PARAMS));
+	memcpy(&info->params, &tmp_params, sizeof(tmp_params));
 	spin_unlock_irqrestore(&info->lock, flags);
 
 	mgslpc_change_params(info, tty);
@@ -1831,7 +1832,7 @@ static int get_txidle(MGSLPC_INFO * info, int __user *idle_mode)
 	int err;
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("get_txidle(%s)=%d\n", info->device_name, info->idle_mode);
-	COPY_TO_USER(err,idle_mode, &info->idle_mode, sizeof(int));
+	COPY_TO_USER(err, idle_mode, &info->idle_mode, sizeof(*idle_mode));
 	if (err)
 		return -EFAULT;
 	return 0;
@@ -1854,7 +1855,7 @@ static int get_interface(MGSLPC_INFO * info, int __user *if_mode)
 	int err;
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("get_interface(%s)=%d\n", info->device_name, info->if_mode);
-	COPY_TO_USER(err,if_mode, &info->if_mode, sizeof(int));
+	COPY_TO_USER(err, if_mode, &info->if_mode, sizeof(*if_mode));
 	if (err)
 		return -EFAULT;
 	return 0;
@@ -1959,7 +1960,7 @@ static int wait_events(MGSLPC_INFO * info, int __user *mask_ptr)
 	struct	_input_signal_events oldsigs, newsigs;
 	DECLARE_WAITQUEUE(wait, current);
 
-	COPY_FROM_USER(rc,&mask, mask_ptr, sizeof(int));
+	COPY_FROM_USER(rc, &mask, mask_ptr, sizeof(mask));
 	if (rc)
 		return  -EFAULT;
 
-- 
2.14.2

