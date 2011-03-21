From: Dan Carpenter <error27@gmail.com>
Date: Mon, 21 Mar 2011 14:59:48 +0000
Subject: Re: [patch] rapidio: potential null deref on failure path
Message-Id: <20110321145948.GP2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319044032.GC2008@bicker>
 <0CE8B6BE3C4AD74AB97D9D29BD24E55201A588F5@CORPEXCH1.na.ads.idt.com>
In-Reply-To: <0CE8B6BE3C4AD74AB97D9D29BD24E55201A588F5@CORPEXCH1.na.ads.idt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Bounine, Alexandre" <Alexandre.Bounine@idt.com>
Cc: Matt Porter <mporter@kernel.crashing.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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


