From: Robin Getz <rgetz@blackfin.uclinux.org>
Date: Thu, 02 Aug 2007 14:58:47 +0000
Subject: Re: [PATCH 06/68] 0 -> NULL, for arch/frv
Message-Id: <200708021058.47811.rgetz@blackfin.uclinux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17167@ifs.emn.fr> <8bd0f97a0708010303j7f443b06lf9d77f6d36816237@mail.gmail.com> <46B062AF.1040907@student.ltu.se>
In-Reply-To: <46B062AF.1040907@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: Mike Frysinger <vapier.adi@gmail.com>, Yoann Padioleau <padator@wanadoo.fr>, David Howells <dhowells@redhat.com>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

On Wed 1 Aug 2007 06:38, Richard Knutsson pondered:
> If I understood Robin correctly, he suggested that checkpatch.pl would 
> tell to convert "x = NULL" to "!x", if that would be the preferred way.

I guess I was asking - _if_ this is really important - lets pick a 
preferred way, and try to use the existing infrastructure (sparce 
or checkpatch.pl) to try to enforce it.

If it is just pedantic - let it go. There are lots of ways to do the 
same thing, one is not necessarily more correct. (but in this case - 
I see the point, and agree).

> BTW, too bad checkpatch.pl does not know the types, since it otherwise 
> could check for the "x [=!]= 0"-thing.

Then let's ask people to use sparse on anything in their diffstat.
(or at least recommend it).

Sparse isn't mentioned in Documentation/SubmittingPatches yet. (if
it is a suggestion)

Even something completely stupid like:

diff -uprN old new | diffstat -p 0 | grep -v changed | awk '{print $1}' | sed 's/\.c/\.o/' | xargs make C=2

worked for me.

-Robin
