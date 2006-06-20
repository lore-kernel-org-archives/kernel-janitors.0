From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 20 Jun 2006 00:09:15 +0000
Subject: Re: [KJ] [PATCH] Fix spelling and grammar mistakes in
Message-Id: <20060619170915.c4dab8aa.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <446FC871.3050408@hrz.tu-chemnitz.de>
In-Reply-To: <446FC871.3050408@hrz.tu-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 20 Jun 2006 01:35:31 +0200 Julius Volz wrote:

> Hi,
> 
> I already sent this mail a month ago when the list was broken, and I
> believe it never got through - it never appeared in the archive. So
> here it is again (the patch still applies to 2.6.17):
> 
> ==%<=====
> 
> Hi,
> 
> this is my first attempt at submitting a patch, so let me know if I'm
> doing something completely wrong. Thunderbird removes trailing spaces,
> so the patch only applies when using the "-l" option. Is that a
> problem? Any advice on configuring Thunderbird to properly send
> patches (besides disabling line-wrap) inline? Or am I better off with
> another mailer?

I like Sylpheed, but it has (some) imap problems, if that
matters.  (sylpheed.good-day.net)
I would say, Yes, having to apply with -l is a problem.

For tbird, look at these:
http://mbligh.org/linuxdocs/Email/Clients/Thunderbird
and
http://lkml.org/lkml/2005/12/27/191

In tbird, I disable line wrap (set it to 0) and I just found out
that I also need to disable format=flowed in the Preferences,
Advanced, Config Editor dialog, and disable HTML email.

It's a bit of a hassle, 'cause then to send a patch, I use
Shift-Write (to enable HTML email on one message), but in the
body text, I select Preformatted and then copy the patch file
contents somehow (xclip doesn't work for me, it segfaults, so I
use gvim to Select All and Copy the patch), then I paste it
into tbird in preformatted mode.  Be careful that tbird doesn't
change the mode on you when you aren't looking or expecting it.
It does that way too often IMO, but it can be made to work.


> The patch applies to Linus' linux-2.6.17-rc4.
> 
> Thanks,
>   Julius Volz
> 
> Description:
> This patch corrects some of the most obvious spelling and grammar
> mistakes in drivers/acpi/video.c, including some in printk output.
> 
> Signed-Off-By: Julius Volz <juliusrv@gmail.com>
> 
> --- drivers/acpi/video.c.orig	2006-05-21 01:14:58.000000000 +0200
> +++ drivers/acpi/video.c	2006-05-21 01:42:49.000000000 +0200

Use some tool (like quilt) or adjust file names manually.  The patch
should apply with "patch -p1", not -p0.

And post a diffstat of the changes as documented in
Documentation/SubmittingPatches.

> @@ -97,9 +97,9 @@ struct acpi_video_bus_cap {
> 
>  struct acpi_video_device_attrib {
>  	u32 display_index:4;	/* A zero-based instance of the Display */
> -	u32 display_port_attachment:4;	/*This field differenates displays type */
> +	u32 display_port_attachment:4;	/*This field differentiates the display type */
>  	u32 display_type:4;	/*Describe the specific type in use */
> -	u32 vendor_specific:4;	/*Chipset Vendor Specifi */
> +	u32 vendor_specific:4;	/*Chipset Vendor Specific */
>  	u32 bios_can_detect:1;	/*BIOS can detect the device */
>  	u32 depend_on_vga:1;	/*Non-VGA output device whose power is related to
>  				   the VGA device. */
> @@ -460,16 +460,16 @@ acpi_video_bus_POST_options(struct acpi_
>   *		0.	The system BIOS should NOT automatically switch(toggle)
>   *			the active display output.
>   *		1.	The system BIOS should automatically switch (toggle) the
> - *			active display output. No swich event.
> + *			active display output. No switch event.
>   *		2.	The _DGS value should be locked.
>   *		3.	The system BIOS should not automatically switch (toggle) the
>   *			active display output, but instead generate the display switch
>   *			event notify code.
>   *	lcd_flag	:
>   *		0.	The system BIOS should automatically control the brightness level
> - *			of the LCD, when the power changes from AC to DC
> + *			of the LCD when the power changes from AC to DC
>   *		1. 	The system BIOS should NOT automatically control the brightness
> - *			level of the LCD, when the power changes from AC to DC.
> + *			level of the LCD when the power changes from AC to DC.
>   * Return Value:
>   * 		-1	wrong arg.
>   */
> @@ -502,7 +502,7 @@ acpi_video_bus_DOS(struct acpi_video_bus
>   *  Return Value:
>   *  	None
>   *
> - *  Find out all required AML method defined under the output
> + *  Find out all required AML methods defined under the output
>   *  device.
>   */
> 
> @@ -593,7 +593,7 @@ static void acpi_video_device_find_cap(s
>   *  Return Value:
>   *  	None
>   *
> - *  Find out all required AML method defined under the video bus device.
> + *  Find out all required AML methods defined under the video bus device.
>   */
> 
>  static void acpi_video_bus_find_cap(struct acpi_video_bus *video)
> @@ -635,23 +635,23 @@ static int acpi_video_bus_check(struct a
>  	if (!video)
>  		return_VALUE(-EINVAL);
> 
> -	/* Since there is no HID, CID and so on for VGA driver, we have
> +	/* Since there is no HID, CID and so on for VGA drivers, we have
>  	 * to check well known required nodes.
>  	 */
> 
> -	/* Does this device able to support video switching ? */
> +	/* Does this device support video switching? */
>  	if (video->cap._DOS) {
>  		video->flags.multihead = 1;
>  		status = 0;
>  	}
> 
> -	/* Does this device able to retrieve a retrieve a video ROM ? */
> +	/* Does this device support retrieving a video ROM? */
>  	if (video->cap._ROM) {
>  		video->flags.rom = 1;
>  		status = 0;
>  	}
> 
> -	/* Does this device able to configure which video device to POST ? */
> +	/* Does this device support configuring which video device to POST? */
>  	if (video->cap._GPD && video->cap._SPD && video->cap._VPO) {
>  		video->flags.post = 1;
>  		status = 0;
> @@ -824,7 +824,7 @@ acpi_video_device_write_brightness(struc
>  	if (level > 100)
>  		return_VALUE(-EFAULT);
> 
> -	/* validate though the list of available levels */
> +	/* validate through the list of available levels */
>  	for (i = 0; i < dev->brightness->count; i++)
>  		if (level = dev->brightness->levels[i]) {
>  			if (ACPI_SUCCESS
> @@ -1040,10 +1040,10 @@ static int acpi_video_bus_POST_info_seq_
>  			printk(KERN_WARNING PREFIX
>  			       "The motherboard VGA device is not listed as a possible POST device.\n");
>  			printk(KERN_WARNING PREFIX
> -			       "This indicate a BIOS bug.  Please contact the manufacturer.\n");
> +			       "This indicates a BIOS bug. Please contact the manufacturer.\n");
>  		}
>  		printk("%lx\n", options);
> -		seq_printf(seq, "can POST: <intgrated video>");
> +		seq_printf(seq, "can POST: <integrated video>");
>  		if (options & 2)
>  			seq_printf(seq, " <PCI video>");
>  		if (options & 4)
> @@ -1078,7 +1078,7 @@ static int acpi_video_bus_POST_seq_show(
>  		seq_printf(seq, "<not supported>\n");
>  		goto end;
>  	}
> -	seq_printf(seq, "device posted is <%s>\n", device_decode[id & 3]);
> +	seq_printf(seq, "device POSTed is <%s>\n", device_decode[id & 3]);
> 
>        end:
>  	return_VALUE(0);
> @@ -1134,7 +1134,7 @@ acpi_video_bus_write_POST(struct file *f
>  	if (opt > 3)
>  		return_VALUE(-EFAULT);
> 
> -	/* just in case an OEM 'forget' the motherboard... */
> +	/* just in case an OEM 'forgot' the motherboard... */
>  	options |= 1;
> 
>  	if (options & (1ul << opt)) {
> @@ -1499,13 +1499,13 @@ static int acpi_video_device_enumerate(s
>  /*
>   *  Arg:
>   *  	video	: video bus device
> - *  	event	: Nontify Event
> + *  	event	: notify event
>   *
>   *  Return:
>   *  	< 0	: error
>   *
>   *	1. Find out the current active output device.
> - *	2. Identify the next output device to switch
> + *	2. Identify the next output device to switch to.
>   *	3. call _DSS to do actual switch.
>   */
> 
> @@ -1678,12 +1678,12 @@ static void acpi_video_bus_notify(acpi_h
>  		return_VOID;
> 
>  	switch (event) {
> -	case ACPI_VIDEO_NOTIFY_SWITCH:	/* User request that a switch occur,
> +	case ACPI_VIDEO_NOTIFY_SWITCH:	/* User requested a switch,
>  					 * most likely via hotkey. */
>  		acpi_bus_generate_event(device, event, 0);
>  		break;
> 
> -	case ACPI_VIDEO_NOTIFY_PROBE:	/* User plug or remove a video
> +	case ACPI_VIDEO_NOTIFY_PROBE:	/* User plugged in or removed a video
>  					 * connector. */
>  		acpi_video_device_enumerate(video);
>  		acpi_video_device_rebind(video);
> @@ -1846,20 +1846,20 @@ acpi_video_bus_match(struct acpi_device
>  	if (!device || !driver)
>  		return_VALUE(-EINVAL);
> 
> -	/* Since there is no HID, CID for ACPI Video drivers, we have
> +	/* Since there is no HID or CID for ACPI video drivers, we have
>  	 * to check well known required nodes for each feature we support.
>  	 */
> 
> -	/* Does this device able to support video switching ? */
> +	/* Does this device support video switching? */
>  	if (ACPI_SUCCESS(acpi_get_handle(device->handle, "_DOD", &h_dummy1)) &&
>  	    ACPI_SUCCESS(acpi_get_handle(device->handle, "_DOS", &h_dummy2)))
>  		return_VALUE(0);
> 
> -	/* Does this device able to retrieve a video ROM ? */
> +	/* Does this device support retrieving a video ROM? */
>  	if (ACPI_SUCCESS(acpi_get_handle(device->handle, "_ROM", &h_dummy1)))
>  		return_VALUE(0);
> 
> -	/* Does this device able to configure which video head to be POSTed ? */
> +	/* Does this device support configuring which video head to be POSTed? */
>  	if (ACPI_SUCCESS(acpi_get_handle(device->handle, "_VPO", &h_dummy1)) &&
>  	    ACPI_SUCCESS(acpi_get_handle(device->handle, "_GPD", &h_dummy2)) &&
>  	    ACPI_SUCCESS(acpi_get_handle(device->handle, "_SPD", &h_dummy3)))
> 

Corrections look good to me.  Thanks.

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
