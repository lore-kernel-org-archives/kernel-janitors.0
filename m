From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 18 Sep 2006 09:42:47 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/atm
Message-Id: <1158572567.6069.87.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753i63697c8et3e6e1c5706b60d5f@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753i63697c8et3e6e1c5706b60d5f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-atm-general@lists.sourceforge.net

Ar Sul, 2006-09-17 am 17:53 -0700, ysgrifennodd Om Narasimhan:
> Tested by compiling.
> 
> I have not subscribed to ATM list. Please cc me any comments.
> 


NAK - again changes some that don't need to clear the memory they
allocate

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
