From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 30 Oct 2004 15:08:10 +0000
Subject: Re: [KJ] 2.6.10-rc1-kjt1: ixgb_ethtool.c doesn't compile
Message-Id: <20041030150810.GC7330@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70547586018414843=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041024151241.GA1920@stro.at> <20041029235137.GG6677@stusta.de> <29495f1d04102921447ab65101@mail.gmail.com> <20041030050924.GA4374@stusta.de>
In-Reply-To: <20041030050924.GA4374@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: Nish Aravamudan <nish.aravamudan@gmail.com>, kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org

--===============70547586018414843==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 30 Oct 2004, Adrian Bunk wrote:

> On Fri, Oct 29, 2004 at 09:44:18PM -0700, Nish Aravamudan wrote:
> > On Sat, 30 Oct 2004 01:51:37 +0200, Adrian Bunk <bunk@stusta.de> wrote:
> > > On Sun, Oct 24, 2004 at 05:12:41PM +0200, maximilian attems wrote:
> > > >...
> > > > splitted out 168 patches:
> > > > http://debian.stro.at/kjt/2.6.10-rc1-kjt1/split/
> > > 
> > > Could you provide a .tar.gz (or .tar.bz) of the splitted patches
> > > (similar to how Andrew does for -mm)?
> > 
> > Do you mean like the one he provided?
> > 
> > please test out:
> > http://debian.stro.at/kjt/2.6.10-rc1-kjt1/2.6.10-rc1-kjt1.patch.bz2
> > 
> > Admittedly, it's not tarred first, but still... Maybe you mean
> > something else, though, and I'm just confused.
> >...
> 
> No, I'd like to have a .tar.gz of the split directory, similar to
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9/2.6.9-mm1/2.6.9-mm1-broken-out.tar.gz

thanks for the idea! done for all the older kjt releases. 
you'll find latest:
http://debian.stro.at/kjt/2.6.10-rc1-kjt1/2.6.10-rc1-kjt1-split.tar.bz2
http://debian.stro.at/kjt/2.6.10-rc1-kjt1/2.6.10-rc1-kjt1-split.tar.gz
 
> This way, it would be easier to simply grep for a file causing a 
> problem.

thanks a lot for the testing.

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============70547586018414843==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70547586018414843==--
