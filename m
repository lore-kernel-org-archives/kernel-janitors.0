From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jan 2021 12:33:54 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <20210122123354.GR2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
In-Reply-To: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 21, 2021 at 05:15:56PM +0100, Sedat Dilek wrote:
> On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Good catch, Lukas.
> 
> As a tipp:
> Next time you can pass '--subject-prefix="PATCH next-YYYYMMDD"' when
> doing 'git format-patch ...' (or whatever you use to generate the
> patch).

I've never seen anyone use this prefix before.

What does the date really help?  In staging, we apply everything on top
of staging-next and if it doesn't apply then we don't investigate, we
just say "doesn't apply.  resend if needed".

We may as well just say [PATCH linux-next].  No one is ever going to
look up the date if it doesn't apply to the latest linux-next.

regards,
dan carpenter
