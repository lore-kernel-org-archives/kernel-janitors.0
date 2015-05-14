From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 10:31:24 +0000
Subject: re: mfd: Support 88pm80x in 80x driver
Message-Id: <20150514103124.GA21248@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Qiao Zhou,

The patch 70c6cce04066: "mfd: Support 88pm80x in 80x driver" from Jul
9, 2012, leads to the following static checker warning:

	include/linux/mfd/88pm80x.h:352 pm80x_dev_suspend()
	warn: test_bit() takes a bit number

include/linux/mfd/88pm80x.h
   344  #ifdef CONFIG_PM
   345  static inline int pm80x_dev_suspend(struct device *dev)
   346  {
   347          struct platform_device *pdev = to_platform_device(dev);
   348          struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
   349          int irq = platform_get_irq(pdev, 0);
   350  
   351          if (device_may_wakeup(dev))
   352                  set_bit((1 << irq), &chip->wu_flag);
                                ^^^^^^^^^
Smatch is complaining because it's doing a double left shift.  If irq is
larger than 5 then we are corrupting memory.  Also we don't use
->wu_flag as a bitfield, we use it as a boolean so the name is
confusing.

   353  
   354          return 0;
   355  }
   356  
   357  static inline int pm80x_dev_resume(struct device *dev)
   358  {
   359          struct platform_device *pdev = to_platform_device(dev);
   360          struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
   361          int irq = platform_get_irq(pdev, 0);
   362  
   363          if (device_may_wakeup(dev))
   364                  clear_bit((1 << irq), &chip->wu_flag);
                                  ^^^^^^^^^^
Same issue.

   365  
   366          return 0;
   367  }
   368  #endif

drivers/mfd/88pm80x.c
   133  #ifdef CONFIG_PM_SLEEP
   134  static int pm80x_suspend(struct device *dev)
   135  {
   136          struct i2c_client *client = container_of(dev, struct i2c_client, dev);
   137          struct pm80x_chip *chip = i2c_get_clientdata(client);
   138  
   139          if (chip && chip->wu_flag)
                            ^^^^^^^^^^^^^
Here it is used as a bool.

   140                  if (device_may_wakeup(chip->dev))
   141                          enable_irq_wake(chip->irq);
   142  
   143          return 0;
   144  }
   145  
   146  static int pm80x_resume(struct device *dev)
   147  {
   148          struct i2c_client *client = container_of(dev, struct i2c_client, dev);
   149          struct pm80x_chip *chip = i2c_get_clientdata(client);
   150  
   151          if (chip && chip->wu_flag)
                            ^^^^^^^^^^^^^
This is the only other user.

   152                  if (device_may_wakeup(chip->dev))
   153                          disable_irq_wake(chip->irq);
   154  
   155          return 0;
   156  }
   157  #endif


regards,
dan carpenter
