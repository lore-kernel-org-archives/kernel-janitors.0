From: Paolo Teti <paolo.teti@gmail.com>
Date: Tue, 06 Dec 2005 11:11:13 +0000
Subject: Re: [KJ] rfc: print mac addr
Message-Id: <34a7ae040512060311y230073dcg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43956CB7.2060904@bfs.de>
In-Reply-To: <43956CB7.2060904@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi walter

>
> for (i = 0; i < 6; i++)
>    printk("%2.2x%c", dev->dev_addr[i],i = 5 ? '\n' : ':');
>

1. Please post an example or the file name!

2. Are you sure that this portion of code isn't into a DEBUG block
(something like #ifdef DEBUG_xx)?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
