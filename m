From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 Jan 2021 09:20:51 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-Id: <20210123092051.GT2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
 <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
 <20210122123354.GR2696@kadam>
 <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
In-Reply-To: <CA+icZUXxJnhXwiFAJ+f23xWLq-t6ZmF6X_wJPNaEoCVqjP4N=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

In networking then they want you to say which tree it applies to, but
it's not as simple as saying "net" vs "net-next".  If it's a bugfix then
you should write that against "net" but if it's a clean up or a fix to a
recent change then it should be written against "net-next".

Also linux-next is not necessarily the same thing as net-next.
Networking patches should be written against either net or net-next, not
linux-next.

BPF tried to implement similar rules to they're not big enough to impose
their own rules.  It's quite a big headache to try to figure out which
tree to use if you're like me and have no clue about bpf.

Anyway, the point of the net vs net-next is that devs are supposed to
figure out the exact tree and they're supposed to only write net-next if
it doesn't apply to net.

It's not clear to me the value of putting linux-next in the subject.
Doesn't everyone develop against the latest devel tree?  Certainly I
can't imagine any maintainers doing extra work to try figure out the
date of the linux-next release.  Surely, they just say "Doesn't apply to
foo-tree.  Resend if necessary."  That's the fastest and easiest
response when patches don't apply.

regards,
dan carpente
