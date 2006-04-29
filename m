From: Greg KH <greg@kroah.com>
Date: Sat, 29 Apr 2006 07:35:17 +0000
Subject: Re: [KJ] post 2.6.17-rc3 "Stop adding device ids to
Message-Id: <20060429073517.GA1518@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============058761672426479894=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4451BF8B.5030707@nachtwindheim.de>
In-Reply-To: <4451BF8B.5030707@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============058761672426479894==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 28, 2006 at 09:08:59AM +0200, Henne wrote:
> Hi there!
> 
> I've seen a change in the Documentation/pci.txt
> 
> http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=9b860b8c4bde5949b272968597d1426d53080532
> 
> Does that really mean, that no Device-ID's should be added or should they 
> be removed from include/linux/pci_ids.h?

No, just what it says, no new device ids should be added to that file,
unless more than one driver uses it.

> They could be replaced in the drivers, if they are used e.g. max 2 times, 
> with the constant values or if they are used
> more than 2 times (for drivers who support more devices and check that) 
> moved only to them.
> 
> I would write patches if this is in the sense of that.

No, this isn't something that needs to be cleaned up, but rather
something that shouldn't happen in the future.

hope this helps,

greg k-h

--===============058761672426479894==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============058761672426479894==--
