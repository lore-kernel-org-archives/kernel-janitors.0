From: Randy Dunlap <rdunlap@xenotime.net>
Date: Sun, 31 Dec 2006 19:08:40 +0000
Subject: Re: [KJ] Development environment
Message-Id: <20061231110840.ad7257fc.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cad7ef450612291018o3cca19a1y4e0c9e1ca95adadd@mail.gmail.com>
In-Reply-To: <cad7ef450612291018o3cca19a1y4e0c9e1ca95adadd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, 29 Dec 2006 19:18:09 +0100 Alberto Gim=E9nez wrote:

> Hi, I've been subscribed to the list for quite long time, and checked
> project website and so, and I still have some questions.

Hi,
I was hoping that someone (anyone) else would reply, so I waited
a bit, but I'll tell you what I do...

> What is your development environment? I don't mean programs you use, I
> mean the *process*. So, for example, do you download kernels from
> kernel.org and then download on a daily/weekly basis patches? or
> otherwise you use git to keep up-to-date all the time? How 'updated'
> you have to be in order to send acceptable patches?

Patches should be made against a very recent kernel.
If you are using git and the linux-2.6 git repo, then the patches
should always be against the current git repo.

If you are using snapshots (which is what I tend to do), then
they should be against a current snapshot, or just a very recent
one if the 'diff' output wouldn't change *any at all* for
different kernel versions.

So it usually would be quite reasonable to make patches now
against 2.6.20-rc2, but it would be Really Good to make them
against 2.6.20-rc2-git2.

Patches should *not* be made against the stable kernel tree
(like 2.6.19.1) unless the patches are explicitly intended
to be applied to that tree and not to the mainline kernel tree.

So what I do is this:
I download all linux-2.6.N.tar.bz2 tarballs.
I download all patch-2.6.N-rcM.bz2 rc-tarballs.
I download -git snapshots (like 2.6.20-rc2-git2) only when I need
one to build patches against.
I 'git pull linux-2.6' only when tarballs aren't good enough
for whatever I'm trying to do, but I find tarballs usually good
enough.

> I can't figure out what is best approach to keep updated without
> loosing the sight on the whole thing, you know (like 'patch against
> whatever-version-on-git-or-official-patch')?
>=20
> I think those are quite basical questions, but didnt found any answer
> on project website or so. I think could be a FAQ to add to the list
> (aka: how do i *begin* working on this ting?). I'd like to help on
> janitoring Linux kernel, but really don't know how start rolling.

---
~Randy

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
