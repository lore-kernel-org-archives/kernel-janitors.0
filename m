From: "Yankejian (Hackim Yim)" <yankejian@huawei.com>
Date: Thu, 17 Mar 2016 06:48:55 +0000
Subject: Re: net: hns: enet specifies a reference to dsaf
Message-Id: <56EA5357.5020902@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160316194851.GA20386@mwanda>
In-Reply-To: <20160316194851.GA20386@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello dan,

Thanks for pointing it out. i will fix it in next submit.

MBR, Kejian

On 2016/3/17 3:48, Dan Carpenter wrote:
> Hello yankejian,
>
> The patch 48189d6aaf1e: "net: hns: enet specifies a reference to
> dsaf" from Jan 20, 2016, leads to the following static checker
> warning:
>
> 	drivers/net/ethernet/hisilicon/hns/hns_enet.c:1885 hns_nic_dev_probe()
> 	warn: passing zero to 'PTR_ERR'
>
> drivers/net/ethernet/hisilicon/hns/hns_enet.c
>   1882  
>   1883          priv->ae_node = (void *)of_parse_phandle(node, "ae-handle", 0);
>                                         ^^^^^^^^^^^^^^^^
> I don't think this ever returns ERR_PTRs.
>
>   1884          if (IS_ERR_OR_NULL(priv->ae_node)) {
>   1885                  ret = PTR_ERR(priv->ae_node);
>
>
> This should just be ret = -EINVAL because if priv->ae_node is NULL it
> means we are returning success.
>
>   1886                  dev_err(dev, "not find ae-handle\n");
>   1887                  goto out_read_prop_fail;
>   1888          }
>   1889  
>
>
> regards,
> dan carpenter
>
>


