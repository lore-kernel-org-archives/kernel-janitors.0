From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 09 Jan 2008 16:56:41 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <20080109165641.668838af@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de>
	<4785C7D8.2020808@suse.de>
	<20080109123311.GP16309@parisc-linux.org>
	<Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
In-Reply-To: <Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@jikos.cz>
Cc: Matthew Wilcox <matthew@wil.cx>, Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Jan 2008 14:26:26 +0100 (CET)
Jiri Kosina <jikos@jikos.cz> wrote:

> On Wed, 9 Jan 2008, Matthew Wilcox wrote:
> 
> > >  	default:
> > >  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> > > +		unlock_kernel();
> > >  		return -EINVAL;
> > Surely a bug ... shouldn't this return -ENOTTY?

Agreed - ENOTTY. The printk is wrong as well, but this is just getting
shown up by the other changes.

Does anyone even use parallel IDE devices any more ?
