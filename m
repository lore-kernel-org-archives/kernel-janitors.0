From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 03 Aug 2020 14:41:06 +0000
Subject: Re: [PATCH] habanalabs: Fix memory corruption in debugfs
Message-Id: <CAFCwf13LgaFGeg7NSOL6KqMuFoPovbezdCUSjk3S05ZSm=48mA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200803143636.GD346925@mwanda>
In-Reply-To: <20200803143636.GD346925@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omer Shpigelman <oshpigelman@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>, Mike Rapoport <rppt@kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Aug 3, 2020 at 5:36 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This has to be a long instead of a u32 because we write a long value.
> On 64 bit systems, this will cause memory corruption.
>
> Fixes: c216477363a3 ("habanalabs: add debugfs support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/misc/habanalabs/common/debugfs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/misc/habanalabs/common/debugfs.c b/drivers/misc/habanalabs/common/debugfs.c
> index 71cfe1b6fafc..ecd37b427480 100644
> --- a/drivers/misc/habanalabs/common/debugfs.c
> +++ b/drivers/misc/habanalabs/common/debugfs.c
> @@ -19,7 +19,7 @@
>  static struct dentry *hl_debug_root;
>
>  static int hl_debugfs_i2c_read(struct hl_device *hdev, u8 i2c_bus, u8 i2c_addr,
> -                               u8 i2c_reg, u32 *val)
> +                               u8 i2c_reg, long *val)
>  {
>         struct armcp_packet pkt;
>         int rc;
> @@ -36,7 +36,7 @@ static int hl_debugfs_i2c_read(struct hl_device *hdev, u8 i2c_bus, u8 i2c_addr,
>         pkt.i2c_reg = i2c_reg;
>
>         rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
> -                                               0, (long *) val);
> +                                               0, val);
>
>         if (rc)
>                 dev_err(hdev->dev, "Failed to read from I2C, error %d\n", rc);
> @@ -827,7 +827,7 @@ static ssize_t hl_i2c_data_read(struct file *f, char __user *buf,
>         struct hl_dbg_device_entry *entry = file_inode(f)->i_private;
>         struct hl_device *hdev = entry->hdev;
>         char tmp_buf[32];
> -       u32 val;
> +       long val;
>         ssize_t rc;
>
>         if (*ppos)
> @@ -842,7 +842,7 @@ static ssize_t hl_i2c_data_read(struct file *f, char __user *buf,
>                 return rc;
>         }
>
> -       sprintf(tmp_buf, "0x%02x\n", val);
> +       sprintf(tmp_buf, "0x%02lx\n", val);
>         rc = simple_read_from_buffer(buf, count, ppos, tmp_buf,
>                         strlen(tmp_buf));
>
> --
> 2.27.0
>

This patch is:
Reviewed-by: Oded Gabbay <oded.gabbay@gmail.com>

Applied to -fixes,
Thanks!
Oded
