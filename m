From: Oleg Drokin <green@linuxhacker.ru>
Date: Sun, 03 May 2015 20:03:55 +0000
Subject: Re: [PATCH 2/3] staging/lustre: Move /proc/fs/lustre root level files to sysfs
Message-Id: <AD70B0BA-203D-4211-AEBB-B0F873AEA642@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-3-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-3-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On May 3, 2015, at 2:13 PM, Greg Kroah-Hartman wrote:
>> 
>> -#if defined (CONFIG_PROC_FS)
>> -static int obd_proc_version_seq_show(struct seq_file *m, void *v)
>> +static ssize_t version_show(struct kobject *kobj, char *buf)
>> {
>> -	seq_printf(m, "lustre: %s\nkernel: %s\nbuild:  %s\n",
>> -		   LUSTRE_VERSION_STRING, "patchless_client", BUILD_VERSION);
>> -	return 0;
>> +	return snprintf(buf, PAGE_SIZE, "lustre: %s\nkernel: %s\nbuild:  %s\n",
> 
> If you are using sysfs, you never need snprintf() as you had better only
> be sending something smaller than a page, or your code is wrong.

Well, I am copying straight from ext4 here (and in other places),
that I thought was a good model.
Is there a better model?
I guess I can convert to sprintfs in most of places, though.

> As it is here, again, please sysfs is one-value-per-file.
> 
> Yes, in some places we mess up and don't do that, but as long as I'm
> reviewing stuff, you better stick to that.
> 
> And you don't need the kernel version here, or the build version, as all
> of that is obvious from other api calls (i.e. uname).

That would be true if only people did not apply patches to their kernels.
I guess we don't care all that much about kernel version here as it could be
obtained from uname,
but lustre version is kind of important for the case that people patch it up
(and they do), so can I leave just that?

> So this file isn't needed at all.
> 
>> +			LUSTRE_VERSION_STRING, "patchless_client",
>> +			BUILD_VERSION);
>> }
>> -LPROC_SEQ_FOPS_RO(obd_proc_version);
>> 
>> -int obd_proc_pinger_seq_show(struct seq_file *m, void *v)
>> +static ssize_t pinger_show(struct kobject *kobj, char *buf)
>> {
>> -	seq_printf(m, "%s\n", "on");
>> -	return 0;
>> +	return snprintf(buf, PAGE_SIZE, "%s\n", "on");
>> }
> 
> If it can never be a different value, why have this file at all?
> 
>> -LPROC_SEQ_FOPS_RO(obd_proc_pinger);
>> 
>> -static int obd_proc_health_seq_show(struct seq_file *m, void *v)
>> +static ssize_t health_show(struct kobject *kobj, char *buf)
>> {
>> 	bool healthy = true;
>> 	int i;
>> +	size_t offset = 0;
>> 
>> 	if (libcfs_catastrophe)
>> -		seq_printf(m, "LBUG\n");
>> +		offset = snprintf(buf, PAGE_SIZE, "LBUG\n");
>> 
>> 	read_lock(&obd_dev_lock);
>> 	for (i = 0; i < class_devno_max(); i++) {
> 
> This is not a single value per file.
> 
> Are you sure you shouldn't just be using debugfs for some of these?  You
> can do whatever you want in debugfs. As long as you can still run if
> debugfs isn't enabled.

I am definitely going to use debugfs in some cases.
This particular one I guess we'll need to split into per-obd health status
and the overall "system health" that could be easily queried.

>> +#if defined(CONFIG_PROC_FS)
>> /* Root for /proc/fs/lustre */
>> struct proc_dir_entry *proc_lustre_root = NULL;
>> EXPORT_SYMBOL(proc_lustre_root);
>> 
>> struct lprocfs_vars lprocfs_base[] = {
>> -	{ "version", &obd_proc_version_fops },
>> -	{ "pinger", &obd_proc_pinger_fops },
>> -	{ "health_check", &obd_proc_health_fops },
>> -	{ "jobid_var", &obd_proc_jobid_var_fops },
>> -	{ .name =	"jobid_name",
>> -	  .fops =	&obd_proc_jobid_name_fops},
>> 	{ NULL }
>> };
>> 
>> +LUSTRE_RO_ATTR(version);
>> +LUSTRE_RO_ATTR(pinger);
>> +LUSTRE_RO_ATTR(health);
>> +LUSTRE_RW_ATTR(jobid_var);
>> +LUSTRE_RW_ATTR(jobid_name);
> 
> Are these static?  If not, why not?

Yes, they are static.

>> +static struct attribute *lustre_attrs[] = {
>> +	LUSTRE_ATTR_LIST(version),
>> +	LUSTRE_ATTR_LIST(pinger),
>> +	LUSTRE_ATTR_LIST(health),
>> +	LUSTRE_ATTR_LIST(jobid_name),
>> +	LUSTRE_ATTR_LIST(jobid_var),
> 
> Do you really need this type of macro?  Just spell the structures out.

Again, I am going by the fine example of ext4 here.
But I am happy to spell it out if you think it's better that way.

>> +	NULL,
>> +};
>> +
>> static void *obd_device_list_seq_start(struct seq_file *p, loff_t *pos)
>> {
>> 	if (*pos >= class_devno_max())
>> @@ -419,15 +422,36 @@ struct file_operations obd_device_list_fops = {
>> 	.release = seq_release,
>> };
>> 
>> +struct kobject lustre_kobj;
>> +EXPORT_SYMBOL(lustre_kobj);
> 
> EXPORT_SYMBOL_GPL?
> 
> 
>> +
>> +static DECLARE_COMPLETION(lustre_kobj_unregister);
>> +static void lustre_sysfs_release(struct kobject *kobj)
>> +{
>> +	complete(&lustre_kobj_unregister);
> 
> Not good, you should just clean up and go, this means something is
> really wrong, and you should NEVER have a static kobject.  Which you do.
> Which is wrong.

This is how we tell the cleanup code that we are all done, though?
Otherwise if I do kobject_put there and move on (to module unload),
how all the other potential users of my kobject would be protected
from the code disappearign from under them?

I can dynamically allocate lustre_kobj, but that does not really help
this particular scenario.

>> +}
>> +
>> +static struct kobj_type lustre_fsroot_ktype = {
>> +	.default_attrs	= lustre_attrs,
>> +	.sysfs_ops	= &lustre_sysfs_ops,
>> +	.release	= lustre_sysfs_release,
>> +};
>> +
>> int class_procfs_init(void)
>> {
>> 	int rc = 0;
>> 
>> +	rc = kobject_init_and_add(&lustre_kobj, &lustre_fsroot_ktype,
>> +				  fs_kobj, "lustre");
>> +	if (rc)
>> +		goto out;
>> +
>> 	proc_lustre_root = lprocfs_register("fs/lustre", NULL,
>> -					    lprocfs_base, NULL);
>> +					    NULL, NULL);
>> 	if (IS_ERR(proc_lustre_root)) {
>> 		rc = PTR_ERR(proc_lustre_root);
>> 		proc_lustre_root = NULL;
>> +		kobject_put(&lustre_kobj);
>> 		goto out;
>> 	}
>> 
>> @@ -444,6 +468,10 @@ int class_procfs_clean(void)
>> 	if (proc_lustre_root) {
>> 		lprocfs_remove(&proc_lustre_root);
>> 	}
>> +
>> +	kobject_put(&lustre_kobj);
>> +	wait_for_completion(&lustre_kobj_unregister);
> 
> Do you like to just sit and wait for forever?  Because that is what will
> happen.  Don't do that.

ext4 does just that, so I imagined there was some significance here.

Also, before submitting these patches, I did test them. This does work (and why would it not, anyway? We call complete from lustre_sysfs_release above).

In fact cpufreq (the other code I am looking at for examples) does the same thing (Well, they do a bit more stuff in their .release method - they print a debug message ;).

Thanks!

Bye,
    Oleg