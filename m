From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Sep 2020 12:04:44 +0000
Subject: Re: [PATCH][next] staging: media: atomisp: fix memory leak of object flash
Message-Id: <20200903120444.GA8299@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902165852.201155-1-colin.king@canonical.com>
In-Reply-To: <20200902165852.201155-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 05:58:52PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where the call to lm3554_platform_data_func returns an
> error there is a memory leak on the error return path of object
> flash.  Fix this by adding an error return path that will free
> flash and rename labels fail2 to fail3 and fail1 to fail2.

Colin, I know you know this and I don't want to explain things which you
already know but this for the other people in Kernel Janitors.

The error handling in this function is still pretty messed up.  Why
does it "goto fail2" if media_entity_pads_init() fails?  There is no
clean up if atomisp_register_i2c_module() fails.

It's just better to re-write it using the "free the most recent
allocation" system.  The key to the system is if the last allocation
was "flash" then the goto should be something like "goto free_flash;"
so that we know it does the right thing.

One of the advantages of the this system is that it basically writes the
->remove() for you.  All we have to do is add one more line to free the
final allocation from the probe function.  In this driver the lm3554_remove()
has a few things which aren't cleaned up in the probe error handling so
it doesn't seem right.  For example, we need to delete the timer.

   834  static int lm3554_probe(struct i2c_client *client)
   835  {
   836          int err = 0;
   837          struct lm3554 *flash;
   838          unsigned int i;
   839          int ret;

We have both "ret" and "err".  It causes bugs where ever "ret" is used
below.  Let's delete "err".

   840  
   841          flash = kzalloc(sizeof(*flash), GFP_KERNEL);
   842          if (!flash)
   843                  return -ENOMEM;

"flash" is allocated.

   844  
   845          flash->pdata = lm3554_platform_data_func(client);
   846          if (IS_ERR(flash->pdata))
   847                  return PTR_ERR(flash->pdata);

	if (IS_ERR(flash->pdata)) {
		ret = PTR_ERR(flash->pdata);
		goto free_flash;
	}

The lm3554_platform_data_func() function doesn't allocate anything so
"flash" is still the most recent allocation.

   848  
   849          v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
I think this needs to be unwound with the v4l2_device_unregister_subdev()
function.  I'm not totally sure.  But that's how the existing code works
so let's keep it as-is.  Meaning that "subdev" is the most recent
allocation.

   850          flash->sd.internal_ops = &lm3554_internal_ops;
   851          flash->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   852          flash->mode = ATOMISP_FLASH_MODE_OFF;
   853          flash->timeout = LM3554_MAX_TIMEOUT / LM3554_TIMEOUT_STEPSIZE - 1;
   854          ret    855              v4l2_ctrl_handler_init(&flash->ctrl_handler,
   856                                     ARRAY_SIZE(lm3554_controls));
   857          if (ret) {
   858                  dev_err(&client->dev, "error initialize a ctrl_handler.\n");
   859                  goto fail2;
   860          }

This becomes "goto unregister_subdev;".  In the original code the goto
fail2 freed the handler, which is harmless but unnecessary.
"flash->ctrl_handler" is now the most recent allocated.

   861  
   862          for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
   863                  v4l2_ctrl_new_custom(&flash->ctrl_handler, &lm3554_controls[i],
   864                                       NULL);
   865  
   866          if (flash->ctrl_handler.error) {
   867                  dev_err(&client->dev, "ctrl_handler error.\n");
   868                  goto fail2;

Missing error code.

	if (flash->ctrl_handler.error) {
		dev_err(&client->dev, "ctrl_handler error.\n");
		ret = flash->ctrl_handler.error;
		goto free_handler;
	}

I don't think the v4l2_ctrl_new_custom() needs to be unwound so
"flash->ctrl_handler" is still the most recent allocation.

   869          }
   870  
   871          flash->sd.ctrl_handler = &flash->ctrl_handler;
   872          err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
   873          if (err) {
   874                  dev_err(&client->dev, "error initialize a media entity.\n");
   875                  goto fail1;
   876          }

This goto leaks handler.  I suspect the reason is that the original
coder didn't want to call media_entity_cleanup() if media_entity_pads_init()
failed.  The media_entity_cleanup() function doesn't do anything.  We
added it as stub function in 2009 but have was never used it.  The
comments say "It must be called during the cleanup phase after
unregistering the entity and before freeing it."  We haven't
unregistered anything here but we are freeing something.  ¯\_(ツ)_/¯

Anyway calling media_entity_cleanup() is harmless:

	goto free_handler;

   877  
   878          flash->sd.entity.function = MEDIA_ENT_F_FLASH;
   879  
   880          mutex_init(&flash->power_lock);
   881  
   882          timer_setup(&flash->flash_off_delay, lm3554_flash_off_delay, 0);

The timer will need to be deleted in the cleanup.  It's now the most
recent allocation.

   883  
   884          err = lm3554_gpio_init(client);
   885          if (err) {
   886                  dev_err(&client->dev, "gpio request/direction_output fail");
   887                  goto fail2;

goto del_timer;

gpio_init is now the most recent allocation.

   888          }
   889          return atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);


	ret = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
	if (ret)
		goto gpio_uninit;

   890  fail2:
   891          media_entity_cleanup(&flash->sd.entity);
   892          v4l2_ctrl_handler_free(&flash->ctrl_handler);
   893  fail1:
   894          v4l2_device_unregister_subdev(&flash->sd);
   895          kfree(flash);
   896  
   897          return err;
   898  }


Now the error handling look like:

	return 0;

gpio_uninit:
	lm3554_gpio_uninit(client);
del_timer:
	del_timer_sync(&flash->flash_off_delay);
free_handler:
	media_entity_cleanup(&flash->sd.entity);
	v4l2_ctrl_handler_free(&flash->ctrl_handler);
unregister_subdev:
	v4l2_device_unregister_subdev(&flash->sd);
free_flash:
	kfree(flash);

	return ret;

Then to generate the remove function we have to cleanup we would
normally a something like atomisp_unregister_i2c_module() but there is
no way to unregister that.  So just take the error handling code and
remove the labels.  Done!

static int lm3554_remove(struct i2c_client *client)
{
	struct v4l2_subdev *sd = i2c_get_clientdata(client);
	struct lm3554 *flash = to_lm3554(sd);
	int ret;

	// FIXME: unregister i2c module
	ret = lm3554_gpio_uninit(client);
	if (ret)
		dev_err(&client->dev, "gpio request/direction_output fail");
	del_timer_sync(&flash->flash_off_delay);
	media_entity_cleanup(&flash->sd.entity);
	v4l2_ctrl_handler_free(&flash->ctrl_handler);
	v4l2_device_unregister_subdev(&flash->sd);
	kfree(flash);
}

   899  
   900  static int lm3554_remove(struct i2c_client *client)
   901  {
   902          struct v4l2_subdev *sd = i2c_get_clientdata(client);
   903          struct lm3554 *flash = to_lm3554(sd);
   904          int ret;
   905  
   906          media_entity_cleanup(&flash->sd.entity);
   907          v4l2_ctrl_handler_free(&flash->ctrl_handler);
   908          v4l2_device_unregister_subdev(sd);
   909  
   910          atomisp_gmin_remove_subdev(sd);
   911  
   912          del_timer_sync(&flash->flash_off_delay);
   913  
   914          ret = lm3554_gpio_uninit(client);
   915          if (ret < 0)
   916                  goto fail;
   917  
   918          kfree(flash);
   919  
   920          return 0;
   921  fail:
   922          dev_err(&client->dev, "gpio request/direction_output fail");
   923          return ret;
   924  }

regards,
dan carpenter
