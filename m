From: Andreas Dilger <adilger.kernel@dilger.ca>
Date: Tue, 23 Nov 2010 18:02:44 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org> <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de>
In-Reply-To: <4CEBD37E.5060107@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: =?iso-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 2010-11-23, at 07:45, walter harms wrote:
> Maybe we can convince the gcc people to make 0 padding default. That will not solve the problems for other compilers but when they claim "works like gcc" we can press then to support this also. I can imagine that this will close some other subtle leaks also.

It makes the most sense to tackle this at the GCC level, since the added overhead of doing memset(0) on the whole struct may be non-trivial for commonly-used and/or large structures.  Since GCC is already explicitly zeroing the _used_ fields in the struct, it can much more easily determine whether there is padding in the structure, and zero those few bytes as needed.

Cheers, Andreas





