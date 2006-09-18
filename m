From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Date: Mon, 18 Sep 2006 12:07:17 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/atm
Message-Id: <84144f020609180507s540c9d74o5b433b514097267a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753i63697c8et3e6e1c5706b60d5f@mail.gmail.com>
	 <1158572567.6069.87.camel@localhost.localdomain>
In-Reply-To: <1158572567.6069.87.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Om Narasimhan <om.turyx@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-atm-general@lists.sourceforge.net

On 9/18/06, Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> NAK - again changes some that don't need to clear the memory they
> allocate

Yeah, and you really should drop the redundant casts while you're there...
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
