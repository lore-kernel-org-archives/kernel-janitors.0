From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 20 Jan 2005 20:04:13 +0000
Subject: Re: [KJ] [PATCH] unified spinlock
Message-Id: <20050120200413.GL25940@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84131676714339376=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41EFCFDC.4060509@osdl.org>
In-Reply-To: <41EFCFDC.4060509@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============84131676714339376==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 08:50:47AM -0800, Greg KH wrote:
> On Thu, Jan 20, 2005 at 07:44:24AM -0800, Randy.Dunlap wrote:
> > Matthew Wilcox wrote:
> > >I think this is referring to initialisation of spinlocks that are
> > >allocated dynamically, not statically.  If a lock validator can't cope
> > >with that, it needs to be fixed, IMO.
> 
> Yes, it is.  See the number of patches that have been flowing into the
> kernel lately to fix this issue up.

However, the correct way to fix this is to use DEFINE_SPIN_LOCK, not to
make static locks dynamically initialised.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============84131676714339376==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84131676714339376==--
