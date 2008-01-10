From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 10 Jan 2008 20:58:26 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <20080110205826.7c41b247@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de>
	<4785C7D8.2020808@suse.de>
	<20080109123311.GP16309@parisc-linux.org>
	<Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
	<20080109165641.668838af@lxorguk.ukuu.org.uk>
	<Pine.LNX.4.64.0801101601000.25041@twin.jikos.cz>
In-Reply-To: <Pine.LNX.4.64.0801101601000.25041@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jikos@jikos.cz>
Cc: Matthew Wilcox <matthew@wil.cx>, Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 10 Jan 2008 16:01:44 +0100 (CET)
Jiri Kosina <jikos@jikos.cz> wrote:

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

I don't know if POSIX does, but Unix has always used ENOTTY for "I don't
know what this ioctl is" and -EINVAL "for I know what this ioctl is but
the values passed are stupid"
