From: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Date: Mon, 21 Mar 2011 15:15:33 +0000
Subject: RE: [patch] rapidio: potential null deref on failure path
Message-Id: <0CE8B6BE3C4AD74AB97D9D29BD24E55201A5897F@CORPEXCH1.na.ads.idt.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319044032.GC2008@bicker> <0CE8B6BE3C4AD74AB97D9D29BD24E55201A588F5@CORPEXCH1.na.ads.idt.com> <20110321145948.GP2008@bicker>
In-Reply-To: <20110321145948.GP2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In this case I agree. 
Do you want me to move this patch up or you have your own path for it?

Alex. 

-----Original Message-----
From: Dan Carpenter [mailto:error27@gmail.com] 
Sent: Monday, March 21, 2011 11:00 AM
To: Bounine, Alexandre
Cc: Matt Porter; linux-kernel@vger.kernel.org;
kernel-janitors@vger.kernel.org
Subject: Re: [patch] rapidio: potential null deref on failure path

On Mon, Mar 21, 2011 at 05:49:06AM -0700, Bounine, Alexandre wrote:
> Better to combine both conditions:
> 
> if (rio_is_switch(rdev) && rswitch->route_table))
>  		kfree(rswitch->route_table);
> 
> Because there is situation when routine fails to allocate route_table
> for a switch.
> 

kfree() accepts NULL pointers.  People have been removing these checks
all over the tree by the hundreds...  Sorry I should have mentioned 
that.

regards,
dan carpenter


