From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Jan 2010 11:13:25 +0000
Subject: Re: bug list: assigning negative values to unsigned variables
Message-Id: <20100127111325.GC24796@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100127104011.GA24796@bicker> <Pine.LNX.4.64.1001271155430.20256@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1001271155430.20256@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 27, 2010 at 11:57:06AM +0100, Julia Lawall wrote:
> On Wed, 27 Jan 2010, Dan Carpenter wrote:
> 
> > Fixing the places which assign negative values to unsigned variables is a good janitor task.
> 
> I had the impression that assignment to -1 was done sometimes as a 
> portable way to initialize the variable to 0xffff (for any number of f's).  
> So perhaps it is not so trivial to fix.
> 
> julia
> 

The grep removed those.

> > This list is from smatch:  grep -w "fit into 0" warns.txt | grep -v "\-1" | tee err-list

Also it removed some other real bugs as well, which I have listed below.  It 
should have been:  grep -w "fit into 0" warns.txt | grep -vw "\-1" | tee err-list

But you are right assigning -1 is idiomatic.  I'll push a change tomorrow so 
the grep isn't needed.

regards,
dan carpenter

drivers/net/bnx2x_link.c +864 bnx2x_cl45_write(38) warn: value -14 can't fit into 0 'rc'
drivers/net/bnx2x_link.c +884 bnx2x_cl45_write(58) warn: value -14 can't fit into 0 'rc'
drivers/net/bnx2x_link.c +934 bnx2x_cl45_read(40) warn: value -14 can't fit into 0 'rc'
drivers/net/bnx2x_link.c +957 bnx2x_cl45_read(63) warn: value -14 can't fit into 0 'rc'
drivers/pci/hotplug/ibmphp_hpc.c +391 pci_ctrl_write(2) warn: value -19 can't fit into 0 'rc'
drivers/usb/serial/iuu_phoenix.c +573 iuu_clk(133) warn: value -124 can't fit into 0 '*(priv->buf+Count++)'
net/llc/llc_station.c +691 llc_station_init(2) warn: value -105 can't fit into 0 'rc'
net/wireless/wext-compat.c +175 cfg80211_wext_giwrange(34) warn: value -110 can't fit into 0 'range->max_qual.level'
