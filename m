From: Matthew Wilcox <willy@debian.org>
Date: Thu, 26 Feb 2004 23:18:53 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <20040226231853.GA25779@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 25, 2004 at 11:08:03PM +0100, Debian User wrote:
> I tried to remove the cli() calls from serial.c. I just used a global 
> spin_lock_t serial_lock, to replace the cli() calls with 
> spin_lock_irqsave().

Why?  Do you have an SMP CRIS system?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
