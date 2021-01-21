From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 21 Jan 2021 16:22:01 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <CAKXUXMyrZ7oaA2K5vBkG4uVMbjDBg0yHrQwiJNGCnXq_ZBhmLg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
In-Reply-To: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 21, 2021 at 5:16 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
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
>

Thanks for the hint.

> Cannot say if we can add a "Fixes:" tag with commit hash-id of
> "kbuild: check the minimum compiler version in Kconfig" - this missed
> that move.
> Maybe Masahiro does a respin and can fold this into above commit?
> That's not my decision.
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>

...and thanks for the review.

Lukas
