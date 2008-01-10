From: Nikanth Karthikesan <knikanth@suse.de>
Date: Thu, 10 Jan 2008 15:43:41 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <1199979101.4474.89.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <4785C7D8.2020808@suse.de>
	 <20080109123311.GP16309@parisc-linux.org>
	 <Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
	 <20080109165641.668838af@lxorguk.ukuu.org.uk>
	 <478681FE.BANGALORE.BLR.100.174746A.1.ECB1.1@1:7.BANGALORE.BLR.100.0.1.0.1@16>
In-Reply-To: <478681FE.BANGALORE.BLR.100.174746A.1.ECB1.1@1:7.BANGALORE.BLR.100.0.1.0.1@16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@jikos.cz>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Matthew Wilcox <matthew@wil.cx>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2008-01-10 at 16:01 +0100, Jiri Kosina wrote:
> On Wed, 9 Jan 2008, Alan Cox wrote:
> 
> > > > >  	default:
> > > > >  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> > > > > +		unlock_kernel();
> > > > >  		return -EINVAL;
> > > > Surely a bug ... shouldn't this return -ENOTTY?
> > Agreed - ENOTTY. 
> 
> Just out of curiosity, where does POSIX happen to specify ENOTTY as the 
> correct one for unimplemented ioctl?
> 

The printk is also wrong, It should have been, Invalid ioctl for the
device

