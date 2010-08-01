From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 01 Aug 2010 06:12:30 +0000
Subject: Re: [PATCH 1/7] 68328serial: check return value of copy_*_user()
Message-Id: <20100801061230.GA2650@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597881-8365-1-git-send-email-segooon@gmail.com>
 <20100731190907.GE26313@bicker>
In-Reply-To: <20100731190907.GE26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Christoph Egger <siccegge@cs.fau.de>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

On Sat, Jul 31, 2010 at 21:09 +0200, Dan Carpenter wrote:
> On Sat, Jul 31, 2010 at 09:38:00PM +0400, Kulikov Vasiliy wrote:
> > -						sizeof(struct m68k_serial)))
> > -				return -EFAULT;
> > -			copy_to_user((struct m68k_serial *) arg,
> > +			return copy_to_user((struct m68k_serial *) arg,
> >  				    info, sizeof(struct m68k_serial));
> 
> We should return if -EFAULT copy_to_user() failes here.

Right, I was looking for this bug and made it myself :)
Thank you.

> 
> > -			return 0;
> > -			
> >  		default:
> >  			return -ENOIOCTLCMD;
> >  		}
> 
> Smatch would have caught that but I don't have a cross compile
> environment set up.
> 
> regards,
> dan carpenter
