From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Sat, 16 Sep 2006 14:18:47 +0000
Subject: Re: [KJ] [PATCH] olympic.c: Checks for return values
Message-Id: <450C07C7.1020903@batelco.com.bh>
List-Id: <kernel-janitors.vger.kernel.org>
References: <450BB893.6030001@batelco.com.bh>
In-Reply-To: <450BB893.6030001@batelco.com.bh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Frederik Deweerdt wrote:

>If you goto 'op_free_dev', you'll leave the mem io mapped (see
>'op_free_iomap').
>Regards,
>Frederik
>  
>
>
would this be the solution then?

Signed-off-by: Hashem Masoud < masoudh at batelco.com.bh>
---

--- /linux-2.6.17.13/drivers/net/tokenring/olympic.c     2006-09-09 
06:23:24.000000000 +0300
+++ olympic.c   2006-09-16 17:12:07.233793920 +0300
@@ -265,7 +265,10 @@ static int __devinit olympic_probe(struc
        SET_NETDEV_DEV(dev, &pdev->dev);

        pci_set_drvdata(pdev,dev) ;
-       register_netdev(dev) ;
+
+       if (register_netdev(dev) != 0)
+               goto op_free_iomap ;
+
        printk("Olympic: %s registered as: 
%s\n",olympic_priv->olympic_card_name,dev->name);
        if (olympic_priv->olympic_network_monitor) { /* Must go after 
register_netdev as we need the device name */
                char proc_name[20] ;


-- 
Hashem Masoud

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
