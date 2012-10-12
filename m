From: Kees Cook <keescook@chromium.org>
Date: Fri, 12 Oct 2012 17:46:34 +0000
Subject: Re: [next:akpm 18/86] kernel/sys.c:1287:10: warning: comparison of distinct pointer types lacks a ca
Message-Id: <CAGXu5j+pk5izexeE9B6xJvL7Znzyuy4Oof3-8PAkXjHeqCFFSA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012165655.GB20312@localhost>
In-Reply-To: <20121012165655.GB20312@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 12, 2012 at 9:56 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> FYI, there are new compile warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   04b956faad392f46c9a234962a9990196b8e48fc
> commit: b8763455880e371a81b07599bc66ae94f96dc6d6 [18/86] kernel/sys.c: fix stack memory content leak via UNAME26
> config: mn10300-asb2364_defconfig # make ARCH=mn10300 asb2364_defconfig
>
> All warnings:
>
> kernel/sys.c: In function 'override_release':
> kernel/sys.c:1287:10: warning: comparison of distinct pointer types lacks a cast [enabled by default]

Hrm, I don't see this on my builds. Is this check specific to mn10300
in some way?

> vim +1287 kernel/sys.c
>
> be27425d Andi Kleen     2011-08-19  1271
> be27425d Andi Kleen     2011-08-19  1272        if (current->personality & UNAME26) {
> b8763455 Kees Cook      2012-10-12  1273                const char *rest = UTS_RELEASE;
> b8763455 Kees Cook      2012-10-12  1274                char buf[65] = { 0 };
> be27425d Andi Kleen     2011-08-19  1275                int ndots = 0;
> be27425d Andi Kleen     2011-08-19  1276                unsigned v;
> b8763455 Kees Cook      2012-10-12  1277                size_t copy;
> be27425d Andi Kleen     2011-08-19  1278
> be27425d Andi Kleen     2011-08-19  1279                while (*rest) {
> be27425d Andi Kleen     2011-08-19  1280                        if (*rest = '.' && ++ndots >= 3)
> be27425d Andi Kleen     2011-08-19  1281                                break;
> be27425d Andi Kleen     2011-08-19  1282                        if (!isdigit(*rest) && *rest != '.')
> be27425d Andi Kleen     2011-08-19  1283                                break;
> be27425d Andi Kleen     2011-08-19  1284                        rest++;
> be27425d Andi Kleen     2011-08-19  1285                }
> be27425d Andi Kleen     2011-08-19  1286                v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 40;
> b8763455 Kees Cook      2012-10-12 @1287                copy = min(sizeof(buf), max_t(size_t, 1, len));

Should I change this to min_t(size_t, sizeof(buf), max_t(size_t, 1, len)) ?

Thanks!

-Kees

-- 
Kees Cook
Chrome OS Security
