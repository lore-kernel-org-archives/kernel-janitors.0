From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Sun, 17 Sep 2006 13:21:12 +0000
Subject: Re: [KJ] [PATCH] olympic.c: Checks for return values
Message-Id: <450D4BC8.1000108@batelco.com.bh>
List-Id: <kernel-janitors.vger.kernel.org>
References: <450BB893.6030001@batelco.com.bh>
In-Reply-To: <450BB893.6030001@batelco.com.bh>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Alexey Dobriyan wrote:

> That's almost it. However if you follow goto you'll notice that zero
> will be returned which is not a proper indication of error.
> 
> Ergo, I need you to propagate error from register_netdev(),
> read http://mbligh.org/linuxdocs/Email/Clients/Thunderbird , then send
> proper inline patch with proper Signed-off-by line (without "at", normal
> email). Also, you need to buy Thunderbird voodoo doll.
> 
> 
> 

Thanks, this is the newest patch:

Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>
--- 
--- linux-2.6.17.13/drivers/net/tokenring/olympic.c     2006-09-09 06:23:24.000000000 +0300
+++ olympic.c   2006-09-17 15:47:18.293705248 +0300
@@ -265,7 +265,11 @@ static int __devinit olympic_probe(struc
        SET_NETDEV_DEV(dev, &pdev->dev);

        pci_set_drvdata(pdev,dev) ;
-       register_netdev(dev) ;
+
+       if ((i = register_netdev(dev))) {
+               goto op_free_iomap;
+       }
+
        printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
        if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */
                char proc_name[20] ;



I got the Thunderbird voodoo doll! But mutt is just too hard ;-)

-- 
Hashem Masoud
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
