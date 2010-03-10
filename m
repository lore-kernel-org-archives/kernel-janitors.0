From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 09:51:14 +0000
Subject: Re: discussion [patch] /lib/kobject.c
Message-Id: <Pine.LNX.4.64.1003101050390.24684@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4B975F28.4050903@bfs.de>
In-Reply-To: <4B975F28.4050903@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Mar 2010, walter harms wrote:

> 
> 
> Julia Lawall schrieb:
> >> @julia:
> >> i did not check but i can imagine that the pattern
> >> A=kmalloc() ... sprintf(a," ",b);
> >>
> >> come up at some points inside the kernel since a lot of programmers
> >> do not know about asprint().
> > 
> > I came up with the following.  Does it seem ok aside from the stray line 
> > over 80 characters?
> > 
> > If it look slike it is going in the right direction, I will make a proer 
> > patch.  The thing one could be worried about is if the buffer is used for 
> > something else, that requires a larger size than that of the string.  I 
> > haven't yet looked into that.
> > 
> 
> Hi Julia,
> IMHO this is a big improvement.
> 1. it is easy to understand
> 1a. the real janitor work now can start, like cleaning statements as shown below
> 2. strange calculations of length is avoided
> 2a. simple changes do not cause an overflow anymore
> 3. this will actually reduce codesize (only by a few bytes but that does not matter)

Thanks for the feedback.  I will look into making a proper patch.

julia


> I do not thing that reuse of the buffer is a problem, i would prefer
> a policy that uses "%99s" to avoid potential attacks if the source
> is exposed to userspace somehow. (i thing 99.99% of programmer can live
> with that).
> 
> btw: i did  CC the mail to the janitor-ml. I am a janitor only and it is better
> to have more eyes on the code and make a broader discussion; involving people who
> can actually make a  commit.
> 
> NTL your patch was very fast !
> 
> re,
>  wh
> 
> 
> 
> /parport/share.c
> name = kasprintf(GFP_KERNEL, "parport%d", tmp->portnum = tmp->number);
> 
> cachefiles/key.c
> key = kasprintf(GFP_KERNEL, "@%02x%c+", (unsigned)csum, 0);
> /* not to mention the len=0 ;...; len=5 what shows up now. */
> 
> > julia
> > 
> > diff -u -p a/arch/ia64/pci/pci.c b/arch/ia64/pci/pci.c
> > --- a/arch/ia64/pci/pci.c 2010-03-01 07:52:48.000000000 +0100
> > +++ b/arch/ia64/pci/pci.c 2010-03-09 23:32:51.000000000 +0100
> > @@ -366,11 +366,10 @@ pci_acpi_scan_root(struct acpi_device *d
> >  		if (!controller->window)
> >  			goto out2;
> >  
> > -		name = kmalloc(16, GFP_KERNEL);
> > +		name = kasprintf(GFP_KERNEL, "PCI Bus %04x:%02x", domain, bus);
> >  		if (!name)
> >  			goto out3;
> >  
> > -		sprintf(name, "PCI Bus %04x:%02x", domain, bus);
> >  		info.bridge = device;
> >  		info.controller = controller;
> >  		info.name = name;
> > diff -u -p a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> > --- a/arch/powerpc/platforms/pseries/dlpar.c 2010-01-20 13:04:05.000000000 +0100
> > +++ b/arch/powerpc/platforms/pseries/dlpar.c 2010-03-09 23:32:45.000000000 +0100
> > @@ -78,13 +78,12 @@ static struct device_node *dlpar_parse_c
> >  	 * prepend this to the full_name.
> >  	 */
> >  	name = (char *)ccwa + ccwa->name_offset;
> > -	dn->full_name = kmalloc(strlen(name) + 2, GFP_KERNEL);
> > +	dn->full_name = kasprintf(GFP_KERNEL, "/%s", name);
> >  	if (!dn->full_name) {
> >  		kfree(dn);
> >  		return NULL;
> >  	}
> >  
> > -	sprintf(dn->full_name, "/%s", name);
> >  	return dn;
> >  }
> >  
> > @@ -409,15 +408,13 @@ static ssize_t dlpar_cpu_probe(const cha
> >  	 * directory of the device tree.  CPUs actually live in the
> >  	 * cpus directory so we need to fixup the full_name.
> >  	 */
> > -	cpu_name = kzalloc(strlen(dn->full_name) + strlen("/cpus") + 1,
> > -			   GFP_KERNEL);
> > +	cpu_name = kasprintf(GFP_KERNEL, "/cpus%s", dn->full_name);
> >  	if (!cpu_name) {
> >  		dlpar_free_cc_nodes(dn);
> >  		rc = -ENOMEM;
> >  		goto out;
> >  	}
> >  
> > -	sprintf(cpu_name, "/cpus%s", dn->full_name);
> >  	kfree(dn->full_name);
> >  	dn->full_name = cpu_name;
> >  
> > diff -u -p a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> > --- a/arch/s390/hypfs/inode.c 2010-01-29 18:29:07.000000000 +0100
> > +++ b/arch/s390/hypfs/inode.c 2010-03-09 23:32:47.000000000 +0100
> > @@ -426,10 +426,9 @@ struct dentry *hypfs_create_str(struct s
> >  	char *buffer;
> >  	struct dentry *dentry;
> >  
> > -	buffer = kmalloc(strlen(string) + 2, GFP_KERNEL);
> > +	buffer = kasprintf(GFP_KERNEL, "%s\n", string);
> >  	if (!buffer)
> >  		return ERR_PTR(-ENOMEM);
> > -	sprintf(buffer, "%s\n", string);
> >  	dentry > >  	    hypfs_create_file(sb, dir, name, buffer, S_IFREG | REG_FILE_MODE);
> >  	if (IS_ERR(dentry)) {
> > diff -u -p a/arch/x86/pci/acpi.c b/arch/x86/pci/acpi.c
> > --- a/arch/x86/pci/acpi.c 2010-03-01 07:52:48.000000000 +0100
> > +++ b/arch/x86/pci/acpi.c 2010-03-09 23:32:58.000000000 +0100
> > @@ -198,10 +198,9 @@ get_current_resources(struct acpi_device
> >  	if (!info.res)
> >  		goto res_alloc_fail;
> >  
> > -	info.name = kmalloc(16, GFP_KERNEL);
> > +	info.name = kasprintf(GFP_KERNEL, "PCI Bus %04x:%02x", domain, busnum);
> >  	if (!info.name)
> >  		goto name_alloc_fail;
> > -	sprintf(info.name, "PCI Bus %04x:%02x", domain, busnum);
> >  
> >  	info.res_num = 0;
> >  	acpi_walk_resources(device->handle, METHOD_NAME__CRS, setup_resource,
> > diff -u -p a/drivers/acpi/video.c b/drivers/acpi/video.c
> > --- a/drivers/acpi/video.c 2010-03-01 07:52:48.000000000 +0100
> > +++ b/drivers/acpi/video.c 2010-03-09 23:33:11.000000000 +0100
> > @@ -1005,11 +1005,10 @@ static void acpi_video_device_find_cap(s
> >  		result = acpi_video_init_brightness(device);
> >  		if (result)
> >  			return;
> > -		name = kzalloc(MAX_NAME_LEN, GFP_KERNEL);
> > +		name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
> >  		if (!name)
> >  			return;
> >  
> > -		sprintf(name, "acpi_video%d", count++);
> >  		device->backlight = backlight_device_register(name,
> >  			NULL, device, &acpi_backlight_ops);
> >  		kfree(name);
> > @@ -1056,10 +1055,9 @@ static void acpi_video_device_find_cap(s
> >  		if (device->cap._DCS && device->cap._DSS) {
> >  			static int count;
> >  			char *name;
> > -			name = kzalloc(MAX_NAME_LEN, GFP_KERNEL);
> > +			name = kasprintf(GFP_KERNEL, "acpi_video%d", count++);
> >  			if (!name)
> >  				return;
> > -			sprintf(name, "acpi_video%d", count++);
> >  			device->output_dev = video_output_register(name,
> >  					NULL, device, &acpi_output_properties);
> >  			kfree(name);
> > diff -u -p a/drivers/base/module.c b/drivers/base/module.c
> > --- a/drivers/base/module.c 2008-12-07 19:29:06.000000000 +0100
> > +++ b/drivers/base/module.c 2010-03-09 23:33:15.000000000 +0100
> > @@ -14,12 +14,10 @@ static char *make_driver_name(struct dev
> >  {
> >  	char *driver_name;
> >  
> > -	driver_name = kmalloc(strlen(drv->name) + strlen(drv->bus->name) + 2,
> > -			      GFP_KERNEL);
> > +	driver_name = kasprintf(GFP_KERNEL, "%s:%s", drv->bus->name, drv->name);
> >  	if (!driver_name)
> >  		return NULL;
> >  
> > -	sprintf(driver_name, "%s:%s", drv->bus->name, drv->name);
> >  	return driver_name;
> >  }
> >  
> > diff -u -p a/drivers/char/ppdev.c b/drivers/char/ppdev.c
> > --- a/drivers/char/ppdev.c 2009-06-24 21:18:49.000000000 +0200
> > +++ b/drivers/char/ppdev.c 2010-03-09 23:33:01.000000000 +0100
> > @@ -286,12 +286,10 @@ static int register_device (int minor, s
> >  	char *name;
> >  	int fl;
> >  
> > -	name = kmalloc (strlen (CHRDEV) + 3, GFP_KERNEL);
> > +	name = kasprintf(GFP_KERNEL, CHRDEV"%x", minor);
> >  	if (name = NULL)
> >  		return -ENOMEM;
> >  
> > -	sprintf (name, CHRDEV "%x", minor);
> > -
> >  	port = parport_find_number (minor);
> >  	if (!port) {
> >  		printk (KERN_WARNING "%s: no associated port!\n", name);
> > diff -u -p a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> > --- a/drivers/gpu/drm/drm_ioctl.c 2009-06-24 21:18:49.000000000 +0200
> > +++ b/drivers/gpu/drm/drm_ioctl.c 2010-03-09 23:33:14.000000000 +0100
> > @@ -101,14 +101,10 @@ int drm_setunique(struct drm_device *dev
> >  
> >  	master->unique[master->unique_len] = '\0';
> >  
> > -	dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> > -			       strlen(master->unique) + 2, GFP_KERNEL);
> > +	dev->devname = kasprintf(GFP_KERNEL, "%s@%s", dev->driver->pci_driver.name, master->unique);
> >  	if (!dev->devname)
> >  		return -ENOMEM;
> >  
> > -	sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> > -		master->unique);
> > -
> >  	/* Return error if the busid submitted doesn't match the device's actual
> >  	 * busid.
> >  	 */
> > @@ -151,14 +147,10 @@ static int drm_set_busid(struct drm_devi
> >  	else
> >  		master->unique_len = len;
> >  
> > -	dev->devname = kmalloc(strlen(dev->driver->pci_driver.name) +
> > -			       master->unique_len + 2, GFP_KERNEL);
> > +	dev->devname = kasprintf(GFP_KERNEL, "%s@%s", dev->driver->pci_driver.name, master->unique);
> >  	if (dev->devname = NULL)
> >  		return -ENOMEM;
> >  
> > -	sprintf(dev->devname, "%s@%s", dev->driver->pci_driver.name,
> > -		master->unique);
> > -
> >  	return 0;
> >  }
> >  
> > diff -u -p a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
> > --- a/drivers/mtd/devices/block2mtd.c 2008-12-07 19:29:06.000000000 +0100
> > +++ b/drivers/mtd/devices/block2mtd.c 2010-03-09 23:32:50.000000000 +0100
> > @@ -275,12 +275,10 @@ static struct block2mtd_dev *add_device(
> >  
> >  	/* Setup the MTD structure */
> >  	/* make the name contain the block device in */
> > -	name = kmalloc(sizeof("block2mtd: ") + strlen(devname) + 1,
> > -			GFP_KERNEL);
> > +	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
> >  	if (!name)
> >  		goto devinit_err;
> >  
> > -	sprintf(name, "block2mtd: %s", devname);
> >  	dev->mtd.name = name;
> >  
> >  	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
> > diff -u -p a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
> > --- a/drivers/mtd/maps/vmu-flash.c 2009-12-03 14:09:47.000000000 +0100
> > +++ b/drivers/mtd/maps/vmu-flash.c 2010-03-09 23:32:48.000000000 +0100
> > @@ -531,12 +531,10 @@ static void vmu_queryblocks(struct maple
> >  	part_cur->user_blocks = card->tempA;
> >  	part_cur->root_block = card->tempB;
> >  	part_cur->numblocks = card->tempB + 1;
> > -	part_cur->name = kmalloc(12, GFP_KERNEL);
> > +	part_cur->name = kasprintf(GFP_KERNEL, "vmu%d.%d.%d", mdev->port, mdev->unit, card->partition);
> >  	if (!part_cur->name)
> >  		goto fail_name;
> >  
> > -	sprintf(part_cur->name, "vmu%d.%d.%d",
> > -		mdev->port, mdev->unit, card->partition);
> >  	mtd_cur = &card->mtd[card->partition];
> >  	mtd_cur->name = part_cur->name;
> >  	mtd_cur->type = 8;
> > diff -u -p a/drivers/parport/share.c b/drivers/parport/share.c
> > --- a/drivers/parport/share.c 2009-06-05 12:16:39.000000000 +0200
> > +++ b/drivers/parport/share.c 2010-03-09 23:33:23.000000000 +0100
> > @@ -311,7 +311,7 @@ struct parport *parport_register_port(un
> >  	atomic_set (&tmp->ref_count, 1);
> >  	INIT_LIST_HEAD(&tmp->full_list);
> >  
> > -	name = kmalloc(15, GFP_KERNEL);
> > +	name = kasprintf(GFP_KERNEL, "parport%d", tmp->portnum = tmp->number);
> >  	if (!name) {
> >  		printk(KERN_ERR "parport: memory squeeze\n");
> >  		kfree(tmp);
> > @@ -332,7 +332,6 @@ struct parport *parport_register_port(un
> >  	/*
> >  	 * Now that the portnum is known finish doing the Init.
> >  	 */
> > -	sprintf(name, "parport%d", tmp->portnum = tmp->number);
> >  	tmp->name = name;
> >  
> >  	for (device = 0; device < 5; device++)
> > diff -u -p a/fs/cachefiles/key.c b/fs/cachefiles/key.c
> > --- a/fs/cachefiles/key.c 2009-04-13 16:04:31.000000000 +0200
> > +++ b/fs/cachefiles/key.c 2010-03-09 23:35:18.000000000 +0100
> > @@ -78,14 +78,13 @@ char *cachefiles_cook_key(const u8 *raw,
> >  
> >  	_debug("max: %d", max);
> >  
> > -	key = kmalloc(max, GFP_KERNEL);
> > +	key = kasprintf(GFP_KERNEL, "@%02x%c+", (unsigned)csum, 0);
> >  	if (!key)
> >  		return NULL;
> >  
> >  	len = 0;
> >  
> >  	/* build the cooked key */
> > -	sprintf(key, "@%02x%c+", (unsigned) csum, 0);
> >  	len = 5;
> >  	mark = len - 1;
> >  
> > diff -u -p a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> > --- a/fs/hostfs/hostfs_kern.c 2009-07-04 21:27:34.000000000 +0200
> > +++ b/fs/hostfs/hostfs_kern.c 2010-03-09 23:35:19.000000000 +0100
> > @@ -187,13 +187,12 @@ static char *follow_link(char *link)
> >  	*(end + 1) = '\0';
> >  	len = strlen(link) + strlen(name) + 1;
> >  
> > -	resolved = kmalloc(len, GFP_KERNEL);
> > +	resolved = kasprintf(GFP_KERNEL, "%s%s", link, name);
> >  	if (resolved = NULL) {
> >  		n = -ENOMEM;
> >  		goto out_free;
> >  	}
> >  
> > -	sprintf(resolved, "%s%s", link, name);
> >  	kfree(name);
> >  	kfree(link);
> >  	return resolved;
> > @@ -979,13 +978,10 @@ static int hostfs_fill_sb_common(struct 
> >  		req_root = "";
> >  
> >  	err = -ENOMEM;
> > -	host_root_path = kmalloc(strlen(root_ino) + 1
> > -				 + strlen(req_root) + 1, GFP_KERNEL);
> > +	host_root_path = kasprintf(GFP_KERNEL, "%s/%s", root_ino, req_root);
> >  	if (host_root_path = NULL)
> >  		goto out;
> >  
> > -	sprintf(host_root_path, "%s/%s", root_ino, req_root);
> > -
> >  	root_inode = hostfs_iget(sb);
> >  	if (IS_ERR(root_inode)) {
> >  		err = PTR_ERR(root_inode);
> > diff -u -p a/lib/kobject.c b/lib/kobject.c
> > --- a/lib/kobject.c 2010-01-29 18:29:09.000000000 +0100
> > +++ b/lib/kobject.c 2010-03-09 23:35:27.000000000 +0100
> > @@ -415,12 +415,11 @@ int kobject_rename(struct kobject *kobj,
> >  		error = -ENOMEM;
> >  		goto out;
> >  	}
> > -	devpath_string = kmalloc(strlen(devpath) + 15, GFP_KERNEL);
> > +	devpath_string = kasprintf(GFP_KERNEL, "DEVPATH_OLD=%s", devpath);
> >  	if (!devpath_string) {
> >  		error = -ENOMEM;
> >  		goto out;
> >  	}
> > -	sprintf(devpath_string, "DEVPATH_OLD=%s", devpath);
> >  	envp[0] = devpath_string;
> >  	envp[1] = NULL;
> >  
> > @@ -480,12 +479,11 @@ int kobject_move(struct kobject *kobj, s
> >  		error = -ENOMEM;
> >  		goto out;
> >  	}
> > -	devpath_string = kmalloc(strlen(devpath) + 15, GFP_KERNEL);
> > +	devpath_string = kasprintf(GFP_KERNEL, "DEVPATH_OLD=%s", devpath);
> >  	if (!devpath_string) {
> >  		error = -ENOMEM;
> >  		goto out;
> >  	}
> > -	sprintf(devpath_string, "DEVPATH_OLD=%s", devpath);
> >  	envp[0] = devpath_string;
> >  	envp[1] = NULL;
> >  	error = sysfs_move_dir(kobj, new_parent);
> > diff -u -p a/net/atm/proc.c b/net/atm/proc.c
> > --- a/net/atm/proc.c 2010-02-16 11:28:04.000000000 +0100
> > +++ b/net/atm/proc.c 2010-03-09 23:37:33.000000000 +0100
> > @@ -420,10 +420,9 @@ int atm_proc_dev_register(struct atm_dev
> >  	if (!digits)
> >  		digits++;
> >  
> > -	dev->proc_name = kmalloc(strlen(dev->type) + digits + 2, GFP_KERNEL);
> > +	dev->proc_name = kasprintf(GFP_KERNEL, "%s:%d", dev->type, dev->number);
> >  	if (!dev->proc_name)
> >  		goto err_out;
> > -	sprintf(dev->proc_name, "%s:%d", dev->type, dev->number);
> >  
> >  	dev->proc_entry = proc_create_data(dev->proc_name, 0, atm_proc_root,
> >  					   &proc_atm_dev_ops, dev);
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
