From: Jiri Kosina <jikos@jikos.cz>
Date: Wed, 09 Jan 2008 13:26:26 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <4785C7D8.2020808@suse.de>
 <20080109123311.GP16309@parisc-linux.org>
In-Reply-To: <20080109123311.GP16309@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Nikanth Karthikesan <knikanth@suse.de>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Jan 2008, Matthew Wilcox wrote:

> >  	default:
> >  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> > +		unlock_kernel();
> >  		return -EINVAL;
> Surely a bug ... shouldn't this return -ENOTTY?

What POSIX states [1]:

[EINVAL]
    The request or arg argument is not valid for this device.

[ENOTTY]
    The fildes argument is not associated with a STREAMS device that
    accepts control functions.

[1] http://www.opengroup.org/onlinepubs/009695399/functions/ioctl.html

-- 
Jiri Kosina
