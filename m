From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 Jan 2021 17:26:16 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <CAK7LNAQGR=f6G_QXSgjLCKukELHyT9fg3O3c_UC=PR5Oqv4XDA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <20210121161640.GA1101379@ubuntu-m3-large-x86>
In-Reply-To: <20210121161640.GA1101379@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 22, 2021 at 1:16 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Jan 21, 2021 at 05:01:15PM +0100, Lukas Bulwahn wrote:
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
> > ---
> > applies cleanly on next-20210121
> >
> > Masahiro-san, please pick this quick fix-up patch.
>
> Masahiro cannot pick this up because the patch to add clang-version.sh
> to MAINTAINERS is in mmotm.
>
> I think the better solution is for Andrew to drop the current version of
>
> maintainers-add-a-couple-more-files-to-the-clang-llvm-section.patch
>
> and pick up the second one I sent, which allows us to deal with this:
>
> https://lore.kernel.org/lkml/20210114171629.592007-1-natechancellor@gmail.com/


I agree.


> I am not sure it is right for us to maintain cc-version.sh but I am open
> to it if Masahiro agrees.

I am not sure either.


The part in cc-version.sh maintained by Clang folks
will be this single line:

clang_min_version.0.1


You can add cc-version.sh to the coverage if you want.

Or, the following line in MAINTAINERS might be
enough to catch the clang version change.


K:      \b(?i:clang|llvm)\b



I will leave up to you guys.



>
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e5d7cf38ec82..aafbea806a82 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4355,8 +4355,8 @@ B:      https://github.com/ClangBuiltLinux/linux/issues
> >  C:   irc://chat.freenode.net/clangbuiltlinux
> >  F:   Documentation/kbuild/llvm.rst
> >  F:   include/linux/compiler-clang.h
> > +F:   scripts/cc-version.sh
> >  F:   scripts/clang-tools/
> > -F:   scripts/clang-version.sh
> >  F:   scripts/lld-version.sh
> >  K:   \b(?i:clang|llvm)\b
> >
> > --
> > 2.17.1
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210121161640.GA1101379%40ubuntu-m3-large-x86.



-- 
Best Regards
Masahiro Yamada
