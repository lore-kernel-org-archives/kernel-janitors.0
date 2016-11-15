From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Tue, 15 Nov 2016 14:24:45 +0000
Subject: Re: [bug report] amd-xgbe: Add PCI device support
Message-Id: <6c58f8bb-2c53-d2d6-448f-a359e335fd66@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161115111102.GA23305@mwanda>
In-Reply-To: <20161115111102.GA23305@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/15/2016 5:11 AM, Dan Carpenter wrote:
> Hello Lendacky, Thomas,
> 
> The patch 47f164deab22: "amd-xgbe: Add PCI device support" from Nov
> 10, 2016, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c:360 xprop_reg_value_write()
> 	error: uninitialized symbol 'value'.
> 
> drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c
>    348  static ssize_t xprop_reg_value_write(struct file *filp,
>    349                                       const char __user *buffer,
>    350                                       size_t count, loff_t *ppos)
>    351  {
>    352          struct xgbe_prv_data *pdata = filp->private_data;
>    353          unsigned int value;
>    354          ssize_t len;
>    355  
>    356          len = xgbe_common_write(buffer, count, ppos, &value);
> 
> Assume "ppos" is non-zero then we are using uninitialized data.  I
> suspect that xgbe_common_write() is buggy.

Yes, looks like this has been present for a while. I'll submit a patch
to update both xgbe_common_read()/write() to return an error when *ppos
!= 0.

Thanks,
Tom

> 
>    357          if (len < 0)
>    358                  return len;
>    359  
>    360          XP_IOWRITE(pdata, pdata->debugfs_xprop_reg, value);
>    361  
>    362          return len;
>    363  }
> 
> 
> 
> regards,
> dan carpenter
> 
