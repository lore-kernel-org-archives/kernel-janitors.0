From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 21 Jan 2021 16:15:56 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> Kconfig") removed ./scripts/clang-version.sh and moved its content to
> ./scripts/cc-version.sh.
>
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches    F:    scripts/clang-version.sh
>
> The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> changes in ./scripts/clang-version.sh; as the file is removed, track
> changes in ./scripts/cc-version.sh instead now.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Good catch, Lukas.

As a tipp:
Next time you can pass '--subject-prefix="PATCH next-YYYYMMDD"' when
doing 'git format-patch ...' (or whatever you use to generate the
patch).

Cannot say if we can add a "Fixes:" tag with commit hash-id of
"kbuild: check the minimum compiler version in Kconfig" - this missed
that move.
Maybe Masahiro does a respin and can fold this into above commit?
That's not my decision.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=for-next&idl8ad4427f6ea306a1eee951d684a41f517b5986



> ---
> applies cleanly on next-20210121
>
> Masahiro-san, please pick this quick fix-up patch.
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e5d7cf38ec82..aafbea806a82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4355,8 +4355,8 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     include/linux/compiler-clang.h
> +F:     scripts/cc-version.sh
>  F:     scripts/clang-tools/
> -F:     scripts/clang-version.sh
>  F:     scripts/lld-version.sh
>  K:     \b(?i:clang|llvm)\b
>
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210121160115.4676-1-lukas.bulwahn%40gmail.com.
