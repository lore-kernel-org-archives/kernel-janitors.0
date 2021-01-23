From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 23 Jan 2021 02:38:41 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com> <20210122123354.GR2696@kadam>
In-Reply-To: <20210122123354.GR2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 22, 2021 at 1:34 PM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> On Thu, Jan 21, 2021 at 05:15:56PM +0100, Sedat Dilek wrote:
> > On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>=
 wrote:
> > >
> > > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > > ./scripts/cc-version.sh.
> > >
> > > Since then, ./scripts/get_maintainer.pl --self-test=3Dpatterns compla=
ins:
> > >
> > >   warning: no file matches    F:    scripts/clang-version.sh
> > >
> > > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > > changes in ./scripts/clang-version.sh; as the file is removed, track
> > > changes in ./scripts/cc-version.sh instead now.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> > Good catch, Lukas.
> >
> > As a tipp:
> > Next time you can pass '--subject-prefix=3D"PATCH next-YYYYMMDD"' when
> > doing 'git format-patch ...' (or whatever you use to generate the
> > patch).
>
> I've never seen anyone use this prefix before.
>
> What does the date really help?  In staging, we apply everything on top
> of staging-next and if it doesn't apply then we don't investigate, we
> just say "doesn't apply.  resend if needed".
>
> We may as well just say [PATCH linux-next].  No one is ever going to
> look up the date if it doesn't apply to the latest linux-next.
>

Is there an official rule to label patches for Linux-next?

Usually - when I was more active on Linux-next development - folks add
a "PATCH -next" to the subject.
Of course, this needs additionally a hint in the patch/commit message
against which Linux-next release it is applicable.
Linux-next releases are highly dynamic - a patch might be applicable
to one single "-next" release.
Git trees come and go - are resetted to an older version of a Git tree.

As LKML is CCed - think of the hundreds and thousands of patches
coming in daily.
So a more meaningful subject can give a first orientation.
That was my point.

My =E2=82=AC0,02.

- Sedat -
