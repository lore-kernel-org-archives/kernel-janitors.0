From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 31 Jan 2018 17:28:13 +0000
Subject: =?UTF-8?Q?Re:_[v2]_Coccinelle:_zalloc-simple:_Delete_function_?= =?UTF-8?B?4oCca21lbV9jYWNoZV9hbGxvY
Message-Id: <243e83a2-ae0c-2dd2-7f8f-83ac0978cc0e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
In-Reply-To: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: cocci@systeme.lip6.fr

> I removed the blank line at EOF,
> then applied to linux-kbuild/misc.

I have taken another look at this script for the semantic patch language.
I imagined that I could refactor the shown SmPL disjunctions a bit.
But I noticed then that these SmPL rules contain a development mistake.

The deletion for a call of the function “memset” depends on the specification
that a size determination is passed by the expression “E1”.
The function “kmem_cache_alloc” was specified despite of the technical detail
that this function does not get a parameter passed which would correspond
to such a size information.
https://elixir.free-electrons.com/linux/v4.15/source/tools/testing/radix-tree/linux/slab.h#L14
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/tools/testing/radix-tree/linux/slab.h?idS7659c08a7da298aa748854f65f2aa1f31b1378#n14

Thus I suggest to remove it from the first two SmPL rules and omit the rule “r4”.
Will the rule set be more consistent then?

Regards,
Markus
