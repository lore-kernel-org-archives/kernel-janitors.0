From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Tue, 17 Jul 2012 18:39:46 +0000
Subject: Re: [vfs:for-next 97/99] fs/ext3/dir.c:306:14: error: too few arguments to function 'generic_file_ll
Message-Id: <20120717183946.GS31729@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120716095850.GB18633@localhost>
In-Reply-To: <20120716095850.GB18633@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jul 17, 2012 at 12:12:00PM -0500, Eric Sandeen wrote:
> On 7/16/12 11:45 AM, Al Viro wrote:
> > On Mon, Jul 16, 2012 at 10:44:03AM -0500, Eric Sandeen wrote:
> >> Thanks -=20
> >>
> >> I had sent "[PATCH 3/3] ext3: pass custom EOF to generic_file_llseek_s=
ize()" which I think should have fixed this up, along with "vfs: allow cust=
om EOF in generic_file_llseek code"
> >>
> >> And, it is in Al's tree:
> >>
> >> http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdif=
f;h=1073e38331024417f5b0c1fcf7af59b92fb92689
> >>
> >> as is the commit to make ext4 happy:
> >>
> >> http://git.kernel.org/?p=3Dlinux/kernel/git/viro/vfs.git;a=3Dcommitdif=
f;h=AC5d776ddd7933c7aa9bb8fe2f9b3104dff659ca
> >=20
> > Yes, but it still creates a bisect hazard, so I'm going to fix that suc=
ker up, along with
> > the similar mess in quota series.  Will be in #for-next tomorrow.
> >=20
>=20
> Ok, sorry.  My first proposed patch 1/3 would have been ok in this respec=
t (it made a new function) but Matthew Wilcox suggested I change the existi=
ng function.  And I took his advice.  ;)  Oh well.

*shrug*

Just needed to grep for other callers and make the trivial change in them,
in the same commit.  Anyway, it's fixed in today's #for-next.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
