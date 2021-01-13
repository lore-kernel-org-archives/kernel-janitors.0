From: Hans Verkuil <hverkuil@xs4all.nl>
Date: Wed, 13 Jan 2021 16:13:41 +0000
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
Message-Id: <196887f5-677f-0aeb-5f5c-fb4a918d6128@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WMfVDCsxRghKHH@mwanda>
In-Reply-To: <X/WMfVDCsxRghKHH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Antoine Jacquet <royale@zerezo.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com

Hi Dan,

On 06/01/2021 11:10, Dan Carpenter wrote:
> Syzbot discovered that the probe error handling doesn't clean up the
> resources allocated in zr364xx_board_init().  There are several
> related bugs in this code so I have re-written the error handling.
> 
> 1)  Introduce a new function zr364xx_board_uninit() which cleans up
>     the resources in zr364xx_board_init().
> 2)  In zr364xx_board_init() if the call to zr364xx_start_readpipe()
>     fails then release the "cam->buffer.frame[i].lpvbits" memory
>     before returning.  This way every function either allocates
>     everything successfully or it cleans up after itself.
> 3)  Re-write the probe function so that each failure path goto frees
>     the most recent allocation.  That way we don't free anything
>     before it has been allocated and we can also verify that
>     everything is freed.
> 4)  Originally, in the probe function the "cam->v4l2_dev.release"
>     pointer was set to "zr364xx_release" near the start but I moved
>     that assignment to the end, after everything had succeeded.  The
>     release function was never actually called during the probe cleanup
>     process, but with this change I wanted to make it clear that we
>     don't want to call zr364xx_release() until everything is
>     allocated successfully.
> 
> Next I re-wrote the zr364xx_release() function.  Ideally this would
> have been a simple matter of copy and pasting the cleanup code from
> probe and adding an additional call to video_unregister_device().  But
> there are several quirks to note.
> 
> 1)  The original code never called video_unregister_device().  In other
>     words, this is an additional bugfix.

Not a bug, see below.

> 2)  The probe function does not call videobuf_mmap_free() and I don't
>     know where the videobuf_mmap is allocated.  I left the code as-is to
>     avoid introducing a bug in code I don't understand.
> 3)  The zr364xx_board_uninit() has a call to zr364xx_stop_readpipe()
>     which is a change from the original behavior with regards to
>     unloading the driver.  Calling zr364xx_stop_readpipe() on a stopped
>     pipe is not a problem so this is safe and is potentially a bugfix.
> 
> Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/media/usb/zr364xx/zr364xx.c | 50 ++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
> index 1e1c6b4d1874..62a232f995a7 100644
> --- a/drivers/media/usb/zr364xx/zr364xx.c
> +++ b/drivers/media/usb/zr364xx/zr364xx.c
> @@ -1181,15 +1181,11 @@ static int zr364xx_open(struct file *file)
>  	return err;
>  }
>  
> -static void zr364xx_release(struct v4l2_device *v4l2_dev)
> +static void zr364xx_board_uninit(struct zr364xx_camera *cam)
>  {
> -	struct zr364xx_camera *cam > -		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
>  	unsigned long i;
>  
> -	v4l2_device_unregister(&cam->v4l2_dev);
> -
> -	videobuf_mmap_free(&cam->vb_vidq);
> +	zr364xx_stop_readpipe(cam);
>  
>  	/* release sys buffers */
>  	for (i = 0; i < FRAMES; i++) {
> @@ -1200,9 +1196,20 @@ static void zr364xx_release(struct v4l2_device *v4l2_dev)
>  		cam->buffer.frame[i].lpvbits = NULL;
>  	}
>  
> -	v4l2_ctrl_handler_free(&cam->ctrl_handler);
>  	/* release transfer buffer */
>  	kfree(cam->pipe->transfer_buffer);
> +}
> +
> +static void zr364xx_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct zr364xx_camera *cam > +		container_of(v4l2_dev, struct zr364xx_camera, v4l2_dev);
> +
> +	videobuf_mmap_free(&cam->vb_vidq);
> +	video_unregister_device(&cam->vdev);

video_unregister_device() is called in the disconnect function, so calling it again
here is wrong (it detects that the video device is already unregistered, so this
effectively is a NOP).

I have tested this patch with an actual zr364xx device without this line and it works
fine. So you can add my:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

for a v2 without this spurious video_unregister_device().

The v4l2_dev.release() callback is called when all video devices are unregistered
and when all open filehandles to those video devices are closed, i.e. it is called
when the very last user is gone.

Regards,

	Hans

> +	v4l2_ctrl_handler_free(&cam->ctrl_handler);
> +	zr364xx_board_uninit(cam);
> +	v4l2_device_unregister(&cam->v4l2_dev);
>  	kfree(cam);
>  }
>  
> @@ -1376,11 +1383,14 @@ static int zr364xx_board_init(struct zr364xx_camera *cam)
>  	/* start read pipe */
>  	err = zr364xx_start_readpipe(cam);
>  	if (err)
> -		goto err_free;
> +		goto err_free_frames;
>  
>  	DBG(": board initialized\n");
>  	return 0;
>  
> +err_free_frames:
> +	for (i = 0; i < FRAMES; i++)
> +		vfree(cam->buffer.frame[i].lpvbits);
>  err_free:
>  	kfree(cam->pipe->transfer_buffer);
>  	cam->pipe->transfer_buffer = NULL;
> @@ -1409,12 +1419,10 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (!cam)
>  		return -ENOMEM;
>  
> -	cam->v4l2_dev.release = zr364xx_release;
>  	err = v4l2_device_register(&intf->dev, &cam->v4l2_dev);
>  	if (err < 0) {
>  		dev_err(&udev->dev, "couldn't register v4l2_device\n");
> -		kfree(cam);
> -		return err;
> +		goto free_cam;
>  	}
>  	hdl = &cam->ctrl_handler;
>  	v4l2_ctrl_handler_init(hdl, 1);
> @@ -1423,7 +1431,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (hdl->error) {
>  		err = hdl->error;
>  		dev_err(&udev->dev, "couldn't register control\n");
> -		goto fail;
> +		goto unregister;
>  	}
>  	/* save the init method used by this camera */
>  	cam->method = id->driver_info;
> @@ -1496,7 +1504,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	if (!cam->read_endpoint) {
>  		err = -ENOMEM;
>  		dev_err(&intf->dev, "Could not find bulk-in endpoint\n");
> -		goto fail;
> +		goto unregister;
>  	}
>  
>  	/* v4l */
> @@ -1507,10 +1515,11 @@ static int zr364xx_probe(struct usb_interface *intf,
>  
>  	/* load zr364xx board specific */
>  	err = zr364xx_board_init(cam);
> -	if (!err)
> -		err = v4l2_ctrl_handler_setup(hdl);
>  	if (err)
> -		goto fail;
> +		goto unregister;
> +	err = v4l2_ctrl_handler_setup(hdl);
> +	if (err)
> +		goto board_uninit;
>  
>  	spin_lock_init(&cam->slock);
>  
> @@ -1525,16 +1534,21 @@ static int zr364xx_probe(struct usb_interface *intf,
>  	err = video_register_device(&cam->vdev, VFL_TYPE_VIDEO, -1);
>  	if (err) {
>  		dev_err(&udev->dev, "video_register_device failed\n");
> -		goto fail;
> +		goto free_handler;
>  	}
> +	cam->v4l2_dev.release = zr364xx_release;
>  
>  	dev_info(&udev->dev, DRIVER_DESC " controlling device %s\n",
>  		 video_device_node_name(&cam->vdev));
>  	return 0;
>  
> -fail:
> +free_handler:
>  	v4l2_ctrl_handler_free(hdl);
> +board_uninit:
> +	zr364xx_board_uninit(cam);
> +unregister:
>  	v4l2_device_unregister(&cam->v4l2_dev);
> +free_cam:
>  	kfree(cam);
>  	return err;
>  }
> 
