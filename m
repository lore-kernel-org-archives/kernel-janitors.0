From: Dan Carpenter <error27@gmail.com>
Date: Fri, 03 Sep 2010 12:41:06 +0000
Subject: [patch] pm_qos_params: cleanup: terminate a string
Message-Id: <20100903124105.GJ5437@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: mark gross <markgross@thegnar.org>, James Bottomley <James.Bottomley@suse.de>, Frederic Weisbecker <fweisbec@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is just a picky thing, but we pass an possibly unterminated string
to printk if debugging is turned on.  Also printk level is set to
"debug" by pr_debug() so the "KERN_ERR" isn't used.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/pm_qos_params.c b/kernel/pm_qos_params.c
index b7e4c36..310a51e 100644
--- a/kernel/pm_qos_params.c
+++ b/kernel/pm_qos_params.c
@@ -389,10 +389,11 @@ static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
 	} else if (count = 11) { /* len('0x12345678/0') */
 		if (copy_from_user(ascii_value, buf, 11))
 			return -EFAULT;
+		ascii_value[10] = '\0';
 		x = sscanf(ascii_value, "%x", &value);
 		if (x != 1)
 			return -EINVAL;
-		pr_debug(KERN_ERR "%s, %d, 0x%x\n", ascii_value, x, value);
+		pr_debug("%s, %d, 0x%x\n", ascii_value, x, value);
 	} else
 		return -EINVAL;
 
