From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 May 2015 18:07:46 +0000
Subject: Re: [PATCH 1/3] staging/lustre: Generic helpers for sysfs
Message-Id: <20150503180746.GA24370@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430622608-30402-2-git-send-email-green@linuxhacker.ru>
In-Reply-To: <1430622608-30402-2-git-send-email-green@linuxhacker.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, May 02, 2015 at 11:10:06PM -0400, green@linuxhacker.ru wrote:
> From: Oleg Drokin <green@linuxhacker.ru>
> 
> Add generic helpers to allow displaying oof lustre-specific values
> in /sys/fs/lustre
> 
> Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
> ---
>  .../staging/lustre/lustre/include/lprocfs_status.h | 26 ++++++++++++++++++++++
>  .../lustre/lustre/obdclass/lprocfs_status.c        | 24 ++++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/staging/lustre/lustre/include/lprocfs_status.h b/drivers/staging/lustre/lustre/include/lprocfs_status.h
> index d030847..03500a8 100644
> --- a/drivers/staging/lustre/lustre/include/lprocfs_status.h
> +++ b/drivers/staging/lustre/lustre/include/lprocfs_status.h
> @@ -350,6 +350,8 @@ enum {
>  /* class_obd.c */
>  extern struct proc_dir_entry *proc_lustre_root;
>  
> +extern struct kobject lustre_kobj;
> +
>  struct obd_device;
>  struct obd_histogram;
>  
> @@ -742,6 +744,30 @@ static struct file_operations name##_fops = {				\
>  		.release = lprocfs_single_release,			\
>  	}
>  
> +struct lustre_attr {
> +	struct attribute attr;
> +	ssize_t (*show)(struct kobject *kobj, char *);
> +	ssize_t (*store)(struct kobject *kobj, const char *, size_t);
> +};
> +
> +#define LUSTRE_ATTR(name, mode, show, store) \
> +static struct lustre_attr lustre_attr_##name = __ATTR(name, mode, show, store)
> +
> +#define LUSTRE_ATTR_VALUE(name, mode, show, store, value) \
> +static struct lustre_attr lustre_attr_##name = \
> +			{ __ATTR(name, mode, show, store), value }
> +
> +#define LUSTRE_RO_ATTR(name) LUSTRE_ATTR(name, 0444, name##_show, NULL)
> +#define LUSTRE_RW_ATTR(name) LUSTRE_ATTR(name, 0644, name##_show, name##_store)
> +#define LUSTRE_ATTR_LIST(name) &lustre_attr_##name.attr
> +
> +ssize_t lustre_attr_show(struct kobject *kobj,
> +			 struct attribute *attr, char *buf);
> +ssize_t lustre_attr_store(struct kobject *kobj, struct attribute *attr,
> +			 const char *buf, size_t len);
> +
> +extern const struct sysfs_ops lustre_sysfs_ops;
> +
>  /* lproc_ptlrpc.c */
>  struct ptlrpc_request;
>  extern void target_print_req(void *seq_file, struct ptlrpc_request *req);
> diff --git a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
> index c171c6c..bdfd652 100644
> --- a/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
> +++ b/drivers/staging/lustre/lustre/obdclass/lprocfs_status.c
> @@ -2057,3 +2057,27 @@ int lprocfs_obd_rd_max_pages_per_rpc(struct seq_file *m, void *data)
>  EXPORT_SYMBOL(lprocfs_obd_rd_max_pages_per_rpc);
>  
>  #endif
> +
> +ssize_t lustre_attr_show(struct kobject *kobj,
> +			 struct attribute *attr, char *buf)
> +{
> +	struct lustre_attr *a = container_of(attr, struct lustre_attr, attr);
> +
> +	return a->show ? a->show(kobj, buf) : 0;
> +}
> +EXPORT_SYMBOL(lustre_attr_show);
> +
> +ssize_t lustre_attr_store(struct kobject *kobj, struct attribute *attr,
> +			  const char *buf, size_t len)
> +{
> +	struct lustre_attr *a = container_of(attr, struct lustre_attr, attr);
> +
> +	return a->store ? a->store(kobj, buf, len) : 0;
> +}
> +EXPORT_SYMBOL(lustre_attr_store);
> +
> +const struct sysfs_ops lustre_sysfs_ops = {
> +	.show   = lustre_attr_show,
> +	.store  = lustre_attr_store,
> +};
> +EXPORT_SYMBOL(lustre_sysfs_ops);

EXPORT_SYMBOL_GPL for all of these please, as they just wrap sysfs
stuff directly.

Other than that, looks good to me.

greg k-h
