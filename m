From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 21 Jan 2021 16:25:51 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <CAKXUXMyrE6OPmn8ETKqRJ9DOaeRO_n3=uUP3vhjAnqmUGmqdYA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <20210121161640.GA1101379@ubuntu-m3-large-x86>
In-Reply-To: <20210121161640.GA1101379@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 21, 2021 at 5:16 PM Nathan Chancellor
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
>
> I am not sure it is right for us to maintain cc-version.sh but I am open
> to it if Masahiro agrees.
>

Okay, I did not see in linux-next that both changes are coming into
linux-next through to different trees.

Nathan, I guess if you send a follow-up patch to Andrew that is the
best way to handle it, or we wait until both trees land in mainline,
and then just provide a quick fix like this afterwards.

So, Masahiro-san, no need to pick this patch here.

Lukas
