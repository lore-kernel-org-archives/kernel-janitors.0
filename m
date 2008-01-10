From: Jiri Kosina <jikos@jikos.cz>
Date: Thu, 10 Jan 2008 15:01:44 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <Pine.LNX.4.64.0801101601000.25041@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <4785C7D8.2020808@suse.de>
 <20080109123311.GP16309@parisc-linux.org> <Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
 <20080109165641.668838af@lxorguk.ukuu.org.uk>
In-Reply-To: <20080109165641.668838af@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <matthew@wil.cx>, Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Jan 2008, Alan Cox wrote:

> > > >  	default:
> > > >  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> > > > +		unlock_kernel();
> > > >  		return -EINVAL;
> > > Surely a bug ... shouldn't this return -ENOTTY?
> Agreed - ENOTTY. 

Just out of curiosity, where does POSIX happen to specify ENOTTY as the 
correct one for unimplemented ioctl?

-- 
Jiri Kosina
