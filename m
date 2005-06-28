From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 28 Jun 2005 15:36:58 +0000
Subject: Re: [KJ] typo?
Message-Id: <20050628153658.GO5200@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85173582394467218=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050628141624.GA6647@ngolde.de>
In-Reply-To: <20050628141624.GA6647@ngolde.de>
To: kernel-janitors@vger.kernel.org

--===============85173582394467218==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 28, 2005 at 04:45:36PM +0200, Nico Golde wrote:
> * Matthew Wilcox <matthew@wil.cx> [2005-06-28 16:41]:
> > On Tue, Jun 28, 2005 at 04:16:25PM +0200, Nico Golde wrote:
> > > Hi,
> > > do you think that:
> > > printk(KERN_EMERG "Press L1-A to return to the boot prom\n")
> > > is a typo?
> > 
> > On Sparc, no.  What do you think is a typo about it?
> 
> I thought it is because if I understood boot prom correctly
> it is something which has to do with networking and booting.
> But here a user interaction is meant (because of the press)
> and in my opinion this part of the panic code has nothing to
> do with networking.

I think you misunderstand what a boot prom is.  There is no typo here.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============85173582394467218==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85173582394467218==--
