From: Andreas Dilger <adilger.kernel@dilger.ca>
Date: Wed, 24 Nov 2010 00:24:17 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <8B057A3D-D1D5-4875-8A0D-45C9223CD1D7@dilger.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org> <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de> <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca> <20101123121840.e9d17d91.akpm@linux-foundation.org>
In-Reply-To: <20101123121840.e9d17d91.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: wharms@bfs.de, =?iso-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 2010-11-23, at 13:18, Andrew Morton wrote:
> On Tue, 23 Nov 2010 11:02:44 -0700
> Andreas Dilger <adilger.kernel@dilger.ca> wrote:
> 
>> On 2010-11-23, at 07:45, walter harms wrote:
>>> Maybe we can convince the gcc people to make 0 padding default. That will not solve the problems for other compilers but when they claim "works like gcc" we can press then to support this also. I can imagine that this will close some other subtle leaks also.
>> 
>> It makes the most sense to tackle this at the GCC level, since the added overhead of doing memset(0) on the whole struct may be non-trivial for commonly-used and/or large structures.
> 
> We can't reasonably address this with gcc changes.  If gcc starts doing
> what we want in the next release, how long will it be until that
> release is the *oldest* version of gcc which the kernel may be compiled
> with?  Five years?

At the same time, we've had these same issues for 15+ years already, and IMHO I don't think anyone can extract a great deal of "information" from 4 bytes of random data interspersed in the middle of some structure that is otherwise initialized or zeroed out by the compiler.

On the other hand, calling memset() on these structures imposes a (virtually) permanent overhead on all processing of those structures.


If people are genuinely concerned about this kind of "information leak", a far better solution would be to add explicit padding fields to the structures (that are otherwise never going to be used) and then GCC will automatically initialize them without the overhead of initializing the fields twice.

Cheers, Andreas





