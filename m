From: walter harms <wharms@bfs.de>
Date: Tue, 06 Dec 2005 17:11:48 +0000
Subject: Re: [KJ] rfc: print mac addr
Message-Id: <4395C654.5050307@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43956CB7.2060904@bfs.de>
In-Reply-To: <43956CB7.2060904@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Paolo Teti wrote:
> Hi walter
> 
>> for (i = 0; i < 6; i++)
>>    printk("%2.2x%c", dev->dev_addr[i],i = 5 ? '\n' : ':');
>>
> 
> 1. Please post an example or the file name!

cd linux/drivers/net
grep dev_addr *.c | grep printk


> 
> 2. Are you sure that this portion of code isn't into a DEBUG block
> (something like #ifdef DEBUG_xx)?

i did not check every file but looked into a few and the pattern is all 
the same. maybe some of them are inside a #ifdef debug the few i looked 
are not.

i know gregKH added a few dev helper macros but i can not find them 
anymore. The idea is to provide a function like:

void print_mac(struct net_device *dev)
{
    int i;
    printk(KERN_INFO);
    for (i = 0; i < MAX_ADDR_LEN; i++)
         printk("%2.2x%c", dev->dev_addr[i],i = (MAX_ADDR_LEN-1) ? '\n' 
: ':');

}
may you like to return a string ?

re,
  walter



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
