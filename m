From: Debian User <h.vanberkum@chello.nl>
Date: Wed, 25 Feb 2004 23:44:10 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <403D334A.3060300@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Wed, Feb 25, 2004 at 11:08:03PM +0100, Debian User wrote:
> 
>>I tried to remove the cli() calls from serial.c. I just used a global 
>>spin_lock_t serial_lock, to replace the cli() calls with 
>>spin_lock_irqsave().
> 
> 
> Why?  Do you have an SMP CRIS system?
> 
Um no I don't. I don't know the architecture but it looked like a good 
file to start on some newbie work.
But since you ask me this I can assume that there is no SMP CRIS system? :)
If so I gues I can throw away the patch.

Richard
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
