From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 18 Dec 2004 14:47:46 +0000
Subject: Re: [KJ] Re: [PATCH] lcd: replace cli()/sti() with
Message-Id: <20041218144746.GA7113@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12769638841924258=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41C380D0.9020001@ppp0.net>
In-Reply-To: <41C380D0.9020001@ppp0.net>
To: kernel-janitors@vger.kernel.org

--===============12769638841924258==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 18, 2004 at 09:54:49AM +0100, Jan Dittmer wrote:
> > So you still need to disable interrupts, even if you're running under the
> > BKL -- interrupt routines can't acquire the BKL (because it's magic) and
> > acquiring the BKL doesn't disable interrupts.
> 
> But still, two ioctl()s can't run in parallel, can they? The driver isn't
> using any interrupts (I'm aware that this asumption isn't necessarily
> true in the future due to ioctl_unlocked work, etc.).

You're right.  However, let me just clarify that a little due to the
magic nature of the BKL.  It basically simulates being uniprocessor,
and there are other races that exist on a uniprocessor box.  If process A
caalls ioctl() and the ioctl handler does copy_from_user, the kernel may
take a page fault (if the page isn't resident, for example).  If it does,
the kernel will automatically drop the BKL and schedule another process.
If process B then calls ioctl(), you can see the same ioctl be reentered.
Normally this isn't a problem, but it's something to be aware of.  You
can use a semaphore (down()/up()) if you need this to not happen.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============12769638841924258==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12769638841924258==--
