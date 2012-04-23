From: James Morris <jmorris@namei.org>
Date: Mon, 23 Apr 2012 07:21:33 +0000
Subject: Re: [patch] Yama: remove an unused variable
Message-Id: <alpine.LRH.2.02.1204231721090.28016@tundra.namei.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1665246916-1927817337-1335165693=:28016"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420133524.GC26339@elgon.mountain>
In-Reply-To: <20120420133524.GC26339@elgon.mountain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1665246916-1927817337-1335165693=:28016
Content-Type: TEXT/PLAIN; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Apr 2012, Kees Cook wrote:

> On Fri, Apr 20, 2012 at 6:35 AM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > GCC complains that we don't use "one" any more after 389da25f93 "Yama:
> > add additional ptrace scopes".
> >
> > security/yama/yama_lsm.c:322:12: warning: ?one? defined but not used
> > =A0 =A0 =A0 =A0[-Wunused-variable]
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Acked-by: Kees Cook <keescook@chromium.org>
>=20
> Thanks for catching that! I was still building with another set of
> patches that used it. Whoops! :)

Thanks, applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git ne=
xt



- James
--=20
James Morris
<jmorris@namei.org>
--1665246916-1927817337-1335165693=:28016--
