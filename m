From: Razvan Deaconescu <razvan@anaconda.cs.pub.ro>
Date: Mon, 14 May 2007 07:59:53 +0000
Subject: [KJ] Re: [RFC]__sock_create() change
Message-Id: <464816F9.90208@anaconda.cs.pub.ro>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

pradeep singh wrote:
> Hi All,
> 
> the __sock_create in net/socket.c has the following code snippet.
> 
> if (family = PF_INET && type = SOCK_PACKET) {
>      static int warned;
>      if (!warned) {
>           warned = 1;
>           printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n", 
> current->comm);
>      }
>      family = PF_PACKET;
> }
> 
> this may be in place to emit a harmless warning , but why not change it 
> to -
> if (family = PF_INET && type = SOCK_PACKET) {
> 
>      printk(KERN_INFO "%s uses obsolete (PF_INET,SOCK_PACKET)\n", 
> current->comm);
> 
>      family = PF_PACKET;
> }
> 
> Because anyway if(!warning) is going to result in true everytime we 
> enter the function, as static int warning has scope limited to the outer 
> if block.

Not quite so. The warning variable may only have scope within its block 
,but (being static) is stored in a reserved memory area (I think this is 
called linkage ... not sure though). The second time someone would try 
creating a socket using PF_INET and SOCK_PACKET, he/she would not get 
that warning as 'warning' is already set (warning = 1, that is).

Razvan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
