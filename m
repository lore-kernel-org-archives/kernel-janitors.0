From: =?UTF-8?B?UMOhZHJhaWcgQnJhZHk=?= <P@draigBrady.com>
Date: Wed, 24 Nov 2010 11:46:33 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <4CECFB19.1090003@draigBrady.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com> <20101112120834.33062900.akpm@linux-foundation.org> <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de> <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca> <4CECECA2.6070301@draigBrady.com> <20101124110535.GD5139@cr0.nay.redhat.com>
In-Reply-To: <20101124110535.GD5139@cr0.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?QW3DqXJpY28gV2FuZw==?= <xiyou.wangcong@gmail.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, wharms@bfs.de, Eric Dumazet <eric.dumazet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 24/11/10 11:05, Américo Wang wrote:
> On Wed, Nov 24, 2010 at 10:44:50AM +0000, Pádraig Brady wrote:
>> On 23/11/10 18:02, Andreas Dilger wrote:
>>> On 2010-11-23, at 07:45, walter harms wrote:
>>>> Maybe we can convince the gcc people to make 0 padding default. That will not solve the problems for other compilers but when they claim "works like gcc" we can press then to support this also. I can imagine that this will close some other subtle leaks also.
>>>
>>> It makes the most sense to tackle this at the GCC level, since the added overhead of doing memset(0) on the whole struct may be non-trivial for commonly-used and/or large structures.  Since GCC is already explicitly zeroing the _used_ fields in the struct, it can much more easily determine whether there is padding in the structure, and zero those few bytes as needed.
>>
>> Zero padding structs is part of C90. Details here:
>> http://www.pixelbeat.org/programming/gcc/auto_init.html
> 
> Nope.
> 
>>
>> gcc doesn't zero pad when _all_ elements are specified.
>>
> 
> That is what gcc does, not what C standard specifies.

Looks like gcc is following the standard exactly.

C90 - 6.5.7
C99 - 6.7.8

  If there are fewer initializers in a brace-enclosed list than
  there are elements or members of an aggregate ... the remainder
  of the aggregate shall be initialized implicitly the same as
  objects that have static storage duration.

cheers,
Pádraig.
