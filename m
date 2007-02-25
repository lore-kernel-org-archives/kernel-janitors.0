From: Dmitry Torokhov <dtor@insightbb.com>
Date: Sun, 25 Feb 2007 03:37:32 +0000
Subject: Re: [KJ] [RFC][PATCH] BIT macro cleanup
Message-Id: <200702242237.33182.dtor@insightbb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b44d3fb0702230215o2fbd5a3y25729e481a447149@mail.gmail.com> <45DF6E20.9060604@student.ltu.se> <20070224111124.GB3609@suse.cz>
In-Reply-To: <20070224111124.GB3609@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-joystick@atrey.karlin.mff.cuni.cz
Cc: Vojtech Pavlik <vojtech@suse.cz>, Richard Knutsson <ricknu-0@student.ltu.se>, Milind Choudhary <milindchoudhary@gmail.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, linux-input@atrey.karlin.mff.cuni.cz

On Saturday 24 February 2007 06:11, Vojtech Pavlik wrote:
> > The reason I don't like it with modulo is simply because it hides 
> > potential bugs (when x is to big). 
> 
> That would be my only concern - losing compiler warnings.
> 

I think most dangerous scenario is when both shift operands are not constant
but compiler will not help us in this case...
 
-- 
Dmitry
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
