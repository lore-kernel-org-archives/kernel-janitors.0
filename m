From: Greg KH <greg@kroah.com>
Date: Thu, 20 Jan 2005 16:50:47 +0000
Subject: Re: [KJ] [PATCH] unified spinlock
Message-Id: <20050120165045.GA9097@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17449380053513064=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EFCFDC.4060509@osdl.org>
In-Reply-To: <41EFCFDC.4060509@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============17449380053513064==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 07:44:24AM -0800, Randy.Dunlap wrote:
> Matthew Wilcox wrote:
> >I think this is referring to initialisation of spinlocks that are
> >allocated dynamically, not statically.  If a lock validator can't cope
> >with that, it needs to be fixed, IMO.
> >
> Having just looked at the LWN.net article, is this (still) true?
> 
> <quote>
> The stated reasons for this change include consistency and making life 
> easier for automatic lock validators. There is also an unstated, but 
> evident reason: the assignment form of lock initialization gets in the 
> way of the realtime preemption patches. Those patches change most 
> spinlocks in the kernel to a different, mutex type, and that breaks 
> the initializers. As a result, the preemption patches must change all 
> of those initializations throughout the kernel. By putting those 
> specific changes into the mainline, it is possible to make the 
> realtime patches smaller, less intrusive, and a little bit less scary.
> </quote>

Yes, it is.  See the number of patches that have been flowing into the
kernel lately to fix this issue up.

thanks,

greg k-h

--===============17449380053513064==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17449380053513064==--
