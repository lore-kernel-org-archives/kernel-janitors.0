From: mark gross <markgross@thegnar.org>
Date: Tue, 07 Sep 2010 06:22:27 +0000
Subject: Re: [patch] pm_qos_params: cleanup: terminate a string
Message-Id: <20100907062227.GB25651@gvim.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100903124105.GJ5437@bicker>
In-Reply-To: <20100903124105.GJ5437@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, mark gross <markgross@thegnar.org>, James Bottomley <James.Bottomley@suse.de>, Frederic Weisbecker <fweisbec@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 03, 2010 at 02:41:06PM +0200, Dan Carpenter wrote:
> This is just a picky thing, but we pass an possibly unterminated string
> to printk if debugging is turned on.  Also printk level is set to
> "debug" by pr_debug() so the "KERN_ERR" isn't used.

Picky is good.  But we should probably get the other pr_debug fixed and
return -EINVAL if the strlen of the ascii_value is not bigger than 10.

thanks for finding my screw up!


> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/kernel/pm_qos_params.c b/kernel/pm_qos_params.c
> index b7e4c36..310a51e 100644
> --- a/kernel/pm_qos_params.c
> +++ b/kernel/pm_qos_params.c
> @@ -389,10 +389,11 @@ static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
>  	} else if (count = 11) { /* len('0x12345678/0') */
>  		if (copy_from_user(ascii_value, buf, 11))
>  			return -EFAULT;
> +		ascii_value[10] = '\0';
>  		x = sscanf(ascii_value, "%x", &value);
>  		if (x != 1)
>  			return -EINVAL;
> -		pr_debug(KERN_ERR "%s, %d, 0x%x\n", ascii_value, x, value);
> +		pr_debug("%s, %d, 0x%x\n", ascii_value, x, value);
>  	} else
>  		return -EINVAL;
>  

Updated version of this patch:

--mark

Signed-off-by: mark gross <markgross@thegnar.org>

Subject: [PATCH] correct some pr_debug misuse and add a stronger parrameter check to
 pm_qos_write for the ascii hex value case.  Thanks to Dan Carpenter for
 pointing out the problem!

---
 kernel/pm_qos_params.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/pm_qos_params.c b/kernel/pm_qos_params.c
index f42d3f7..db4295a 100644
--- a/kernel/pm_qos_params.c
+++ b/kernel/pm_qos_params.c
@@ -155,7 +155,7 @@ static void update_target(int pm_qos_class)
 		call_notifier = 1;
 		atomic_set(&pm_qos_array[pm_qos_class]->target_value,
 				extreme_value);
-		pr_debug(KERN_ERR "new target for qos %d is %d\n", pm_qos_class,
+		pr_debug("new target for qos %d is %d\n", pm_qos_class,
 			atomic_read(&pm_qos_array[pm_qos_class]->target_value));
 	}
 	spin_unlock_irqrestore(&pm_qos_lock, flags);
@@ -374,10 +374,12 @@ static ssize_t pm_qos_power_write(struct file *filp, const char __user *buf,
 	} else if (count = 11) { /* len('0x12345678/0') */
 		if (copy_from_user(ascii_value, buf, 11))
 			return -EFAULT;
+		if (strlen(ascii_value) > 10)
+			return -EINVAL;
 		x = sscanf(ascii_value, "%x", &value);
 		if (x != 1)
 			return -EINVAL;
-		pr_debug(KERN_ERR "%s, %d, 0x%x\n", ascii_value, x, value);
+		pr_debug("%s, %d, 0x%x\n", ascii_value, x, value);
 	} else
 		return -EINVAL;
 
-- 
1.7.0.4

