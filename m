From: Matthew Wilcox <willy@debian.org>
Date: Thu, 15 Jan 2004 04:24:32 +0000
Subject: Re: [Kernel-janitors] Kconfig cleanups
Message-Id: <20040115042432.GA9684@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040114065742.GG10711@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 15, 2004 at 12:20:44AM +0000, Dave Jones wrote:
> Sparc64 has a DRM module for Creator3D, which I *think* is SBUS.
> Yes, Sparc* has to be different and put its DRM Kconfig stuff
> in arch/sparc64/Kconfig instead.

Part of the reason for this cleanup is to remove crap like that from
the arch Kconfig files; keeping all this up to date is one of the least
interesting bits of being an arch maintainer.  I'll incorporate removing
this from Sparc64 into my patchset.  Thanks.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
