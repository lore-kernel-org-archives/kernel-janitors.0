From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 May 2015 18:13:12 +0000
Subject: Re: [PATCH 2/3] staging/lustre: Move /proc/fs/lustre root level files to sysfs
Message-Id: <20150503181312.GB24370@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-3-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-3-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 11:10:07PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> except devices, for now.
> 
> Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
> ---
>  .../lustre/lustre/obdclass/linux/linux-module.c    | 116 +++++++++++++--------

I need Documentation/ABI/ files for all of these sysfs files.  Please
put them in the drivers/staging/lustre/ directory for now.


>  1 file changed, 72 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
> index 06944b8..abfb671 100644
> --- a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
> +++ b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
> @@ -64,6 +64,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/miscdevice.h>
>  #include <linux/seq_file.h>
> +#include <linux/kobject.h>
>  
>  #include "../../../include/linux/libcfs/libcfs.h"
>  #include "../../../include/linux/lnet/lnetctl.h"
> @@ -216,29 +217,26 @@ struct miscdevice obd_psdev = {
>  };
>  
>  
> -#if defined (CONFIG_PROC_FS)
> -static int obd_proc_version_seq_show(struct seq_file *m, void *v)
> +static ssize_t version_show(struct kobject *kobj, char *buf)
>  {
> -	seq_printf(m, "lustre: %s\nkernel: %s\nbuild:  %s\n",
> -		   LUSTRE_VERSION_STRING, "patchless_client", BUILD_VERSION);
> -	return 0;
> +	return snprintf(buf, PAGE_SIZE, "lustre: %s\nkernel: %s\nbuild:  %s\n",

If you are using sysfs, you never need snprintf() as you had better only
be sending something smaller than a page, or your code is wrong.

As it is here, again, please sysfs is one-value-per-file.

Yes, in some places we mess up and don't do that, but as long as I'm
reviewing stuff, you better stick to that.

And you don't need the kernel version here, or the build version, as all
of that is obvious from other api calls (i.e. uname).

So this file isn't needed at all.

> +			LUSTRE_VERSION_STRING, "patchless_client",
> +			BUILD_VERSION);
>  }
> -LPROC_SEQ_FOPS_RO(obd_proc_version);
>  
> -int obd_proc_pinger_seq_show(struct seq_file *m, void *v)
> +static ssize_t pinger_show(struct kobject *kobj, char *buf)
>  {
> -	seq_printf(m, "%s\n", "on");
> -	return 0;
> +	return snprintf(buf, PAGE_SIZE, "%s\n", "on");
>  }

If it can never be a different value, why have this file at all?

> -LPROC_SEQ_FOPS_RO(obd_proc_pinger);
>  
> -static int obd_proc_health_seq_show(struct seq_file *m, void *v)
> +static ssize_t health_show(struct kobject *kobj, char *buf)
>  {
>  	bool healthy = true;
>  	int i;
> +	size_t offset = 0;
>  
>  	if (libcfs_catastrophe)
> -		seq_printf(m, "LBUG\n");
> +		offset = snprintf(buf, PAGE_SIZE, "LBUG\n");
>  
>  	read_lock(&obd_dev_lock);
>  	for (i = 0; i < class_devno_max(); i++) {

This is not a single value per file.

Are you sure you shouldn't just be using debugfs for some of these?  You
can do whatever you want in debugfs. As long as you can still run if
debugfs isn't enabled.


> @@ -256,8 +254,9 @@ static int obd_proc_health_seq_show(struct seq_file *m, void *v)
>  		read_unlock(&obd_dev_lock);
>  
>  		if (obd_health_check(NULL, obd)) {
> -			seq_printf(m, "device %s reported unhealthy\n",
> -				   obd->obd_name);
> +			offset += snprintf(buf + offset, PAGE_SIZE - offset,
> +					   "device %s reported unhealthy\n",
> +					   obd->obd_name);
>  			healthy = false;
>  		}
>  		class_decref(obd, __func__, current);
> @@ -266,32 +265,30 @@ static int obd_proc_health_seq_show(struct seq_file *m, void *v)
>  	read_unlock(&obd_dev_lock);
>  
>  	if (healthy)
> -		seq_puts(m, "healthy\n");
> +		offset += snprintf(buf + offset, PAGE_SIZE - offset,
> +				   "healthy\n");
>  	else
> -		seq_puts(m, "NOT HEALTHY\n");
> +		offset += snprintf(buf + offset, PAGE_SIZE - offset,
> +				   "NOT HEALTHY\n");
>  
> -	return 0;
> +	return offset;
>  }
> -LPROC_SEQ_FOPS_RO(obd_proc_health);
>  
> -static int obd_proc_jobid_var_seq_show(struct seq_file *m, void *v)
> +static ssize_t jobid_var_show(struct kobject *kobj, char *buf)
>  {
> -	seq_printf(m, "%s\n", obd_jobid_var);
> -	return 0;
> +	return snprintf(buf, PAGE_SIZE, "%s\n", obd_jobid_var);
>  }
>  
> -static ssize_t obd_proc_jobid_var_seq_write(struct file *file,
> -				const char __user *buffer,
> -				size_t count, loff_t *off)
> +static ssize_t jobid_var_store(struct kobject *kobj,
> +			       const char *buffer,
> +			       size_t count)
>  {
>  	if (!count || count > JOBSTATS_JOBID_VAR_MAX_LEN)
>  		return -EINVAL;
>  
>  	memset(obd_jobid_var, 0, JOBSTATS_JOBID_VAR_MAX_LEN + 1);
>  
> -	/* This might leave the var invalid on error, which is probably fine.*/
> -	if (copy_from_user(obd_jobid_var, buffer, count))
> -		return -EFAULT;
> +	memcpy(obd_jobid_var, buffer, count);
>  
>  	/* Trim the trailing '\n' if any */
>  	if (obd_jobid_var[count - 1] = '\n')
> @@ -299,23 +296,20 @@ static ssize_t obd_proc_jobid_var_seq_write(struct file *file,
>  
>  	return count;
>  }
> -LPROC_SEQ_FOPS(obd_proc_jobid_var);
>  
> -static int obd_proc_jobid_name_seq_show(struct seq_file *m, void *v)
> +static ssize_t jobid_name_show(struct kobject *kobj, char *buf)
>  {
> -	seq_printf(m, "%s\n", obd_jobid_var);
> -	return 0;
> +	return snprintf(buf, PAGE_SIZE, "%s\n", obd_jobid_node);
>  }
>  
> -static ssize_t obd_proc_jobid_name_seq_write(struct file *file,
> -					     const char __user *buffer,
> -					     size_t count, loff_t *off)
> +static ssize_t jobid_name_store(struct kobject *kobj,
> +				const char *buffer,
> +				size_t count)
>  {
>  	if (!count || count > JOBSTATS_JOBID_SIZE)
>  		return -EINVAL;
>  
> -	if (copy_from_user(obd_jobid_node, buffer, count))
> -		return -EFAULT;
> +	memcpy(obd_jobid_node, buffer, count);
>  
>  	obd_jobid_node[count] = 0;
>  
> @@ -325,22 +319,31 @@ static ssize_t obd_proc_jobid_name_seq_write(struct file *file,
>  
>  	return count;
>  }
> -LPROC_SEQ_FOPS(obd_proc_jobid_name);
>  
> +#if defined(CONFIG_PROC_FS)
>  /* Root for /proc/fs/lustre */
>  struct proc_dir_entry *proc_lustre_root = NULL;
>  EXPORT_SYMBOL(proc_lustre_root);
>  
>  struct lprocfs_vars lprocfs_base[] = {
> -	{ "version", &obd_proc_version_fops },
> -	{ "pinger", &obd_proc_pinger_fops },
> -	{ "health_check", &obd_proc_health_fops },
> -	{ "jobid_var", &obd_proc_jobid_var_fops },
> -	{ .name =	"jobid_name",
> -	  .fops =	&obd_proc_jobid_name_fops},
>  	{ NULL }
>  };
>  
> +LUSTRE_RO_ATTR(version);
> +LUSTRE_RO_ATTR(pinger);
> +LUSTRE_RO_ATTR(health);
> +LUSTRE_RW_ATTR(jobid_var);
> +LUSTRE_RW_ATTR(jobid_name);

Are these static?  If not, why not?

> +
> +static struct attribute *lustre_attrs[] = {
> +	LUSTRE_ATTR_LIST(version),
> +	LUSTRE_ATTR_LIST(pinger),
> +	LUSTRE_ATTR_LIST(health),
> +	LUSTRE_ATTR_LIST(jobid_name),
> +	LUSTRE_ATTR_LIST(jobid_var),

Do you really need this type of macro?  Just spell the structures out.


> +	NULL,
> +};
> +
>  static void *obd_device_list_seq_start(struct seq_file *p, loff_t *pos)
>  {
>  	if (*pos >= class_devno_max())
> @@ -419,15 +422,36 @@ struct file_operations obd_device_list_fops = {
>  	.release = seq_release,
>  };
>  
> +struct kobject lustre_kobj;
> +EXPORT_SYMBOL(lustre_kobj);

EXPORT_SYMBOL_GPL?


> +
> +static DECLARE_COMPLETION(lustre_kobj_unregister);
> +static void lustre_sysfs_release(struct kobject *kobj)
> +{
> +	complete(&lustre_kobj_unregister);

Not good, you should just clean up and go, this means something is
really wrong, and you should NEVER have a static kobject.  Which you do.
Which is wrong.

> +}
> +
> +static struct kobj_type lustre_fsroot_ktype = {
> +	.default_attrs	= lustre_attrs,
> +	.sysfs_ops	= &lustre_sysfs_ops,
> +	.release	= lustre_sysfs_release,
> +};
> +
>  int class_procfs_init(void)
>  {
>  	int rc = 0;
>  
> +	rc = kobject_init_and_add(&lustre_kobj, &lustre_fsroot_ktype,
> +				  fs_kobj, "lustre");
> +	if (rc)
> +		goto out;
> +
>  	proc_lustre_root = lprocfs_register("fs/lustre", NULL,
> -					    lprocfs_base, NULL);
> +					    NULL, NULL);
>  	if (IS_ERR(proc_lustre_root)) {
>  		rc = PTR_ERR(proc_lustre_root);
>  		proc_lustre_root = NULL;
> +		kobject_put(&lustre_kobj);
>  		goto out;
>  	}
>  
> @@ -444,6 +468,10 @@ int class_procfs_clean(void)
>  	if (proc_lustre_root) {
>  		lprocfs_remove(&proc_lustre_root);
>  	}
> +
> +	kobject_put(&lustre_kobj);
> +	wait_for_completion(&lustre_kobj_unregister);

Do you like to just sit and wait for forever?  Because that is what will
happen.  Don't do that.

thanks,

greg k-h
