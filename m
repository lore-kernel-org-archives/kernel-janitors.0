From: Andi Kleen <ak@suse.de>
Date: Mon, 23 Jan 2006 12:52:23 +0000
Subject: [KJ] Re: Fixing make mandocs
Message-Id: <200601231352.24068.ak@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59542278737347609=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601230531.27609.ak@suse.de> <20060122205349.0ec46cbe.rdunlap@xenotime.net> <20060123122831.GC11002@admingilde.org>
In-Reply-To: <20060123122831.GC11002@admingilde.org>
To: Martin Waitz <tali@admingilde.org>
Cc: "Randy.Dunlap" <rdunlap@xenotime.net>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============59542278737347609==
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 23 January 2006 13:28, Martin Waitz wrote:
> hoi :)
>
> On Sun, Jan 22, 2006 at 08:53:49PM -0800, Randy.Dunlap wrote:
> > > > > Here would be a good janitor task for 2.6.16. make mandocs
> > > > > currently doesn't build because a number of descriptions are
> > > > > missing parameters etc.  It would be good if someone could fix
> > > > > that and submit patches for 2.6.16.
>
> the thing that really breaks the build is the new __copy_to_user
> prototype which kernel-doc could not understand.
> This is fixed in my tree.
>
> > > Ok good. Are they going into 2.6.16?
>
> I'll try to get at least the one kernel-doc fix into 2.6.16.

I would just send all that fix build failures.

-Andi


--===============59542278737347609==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59542278737347609==--
