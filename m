From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 20 Dec 2004 17:27:33 +0000
Subject: Re: [KJ] Re: [PATCH] pcxx: replace cli()/sti() with
Message-Id: <20041220172733.GK7113@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92249288889509273=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041217223426.11143.44338.87156@localhost.localdomain> <1103554747.30268.24.camel@localhost.localdomain>
In-Reply-To: <1103554747.30268.24.camel@localhost.localdomain>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: James Nelson <james4765@verizon.net>, akpm@osdl.org, kernel-janitors@lists.osdl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--===============92249288889509273==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2004 at 02:59:09PM +0000, Alan Cox wrote:
> On Gwe, 2004-12-17 at 22:34, James Nelson wrote:
> > -	save_flags(flags);
> > -	cli();
> > +	spin_lock_irqsave(&pcxx_lock, flags);
> >  	del_timer_sync(&pcxx_timer);
> 
> Not safe if the lock is grabbed by the timer between the lock and the
> irqsave as it will spin on another cpu and the timer delete will never
> finish.

Right, but wrong reason ...

James admitted he thought the driver was otherwise SMP-safe; he didn't know
how to convert things from the old locking style to proper locking.

The problem with this code section is not the race between local
interrupts and the lock, since irqs are disabled before the cpu tries to
grab the lock.  The problem is that if the lock is grabbed by this code
path, and then the timer running on a different CPU attempts to acquire
the lock, it will spin.  del_timer_sync() will then spin waiting for
the timer to complete.  We're deadlocked.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============92249288889509273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92249288889509273==--
