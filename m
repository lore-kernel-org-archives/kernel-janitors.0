From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jun 2015 13:41:04 +0000
Subject: re: mfd: cros_ec: Use a zero-length array for command data
Message-Id: <20150623134104.GA10310@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Javier Martinez Canillas,

The patch a841178445bb: "mfd: cros_ec: Use a zero-length array for
command data" from Jun 9, 2015, has memory corruption issues.

drivers/platform/chrome/cros_ec_dev.c
   130  static long ec_device_ioctl_xcmd(struct cros_ec_dev *ec, void __user *arg)
   131  {
   132          long ret;
   133          struct cros_ec_command u_cmd;
   134          struct cros_ec_command *s_cmd;
   135
   136          if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
   137                  return -EFAULT;
   138
   139          s_cmd = kmalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insize),
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This can integer overflow on 32 bit systems leading to a smaller s_cmd
than intended.

   140                          GFP_KERNEL);
   141          if (!s_cmd)
   142                  return -ENOMEM;
   143
   144          if (copy_from_user(s_cmd, arg, sizeof(*s_cmd) + u_cmd.outsize)) {
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Memory corruption.

   145                  ret = -EFAULT;
   146                  goto exit;
   147          }
   148

regards,
dan carpenter
