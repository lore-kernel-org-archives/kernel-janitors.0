From: Michal Marek <mmarek@suse.cz>
Date: Fri, 13 May 2011 08:26:48 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <4DCCEB48.7030602@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>	<4DCC4365.3030907@suse.cz>	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>	<4DCC4F05.7010306@suse.cz> <BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
In-Reply-To: <BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12.5.2011 23:38, matt mooney wrote:
> On Thu, May 12, 2011 at 2:20 PM, Michal Marek<mmarek@suse.cz>  wrote:
>> On 12.5.2011 23:07, matt mooney wrote:
>>> 2011/5/12 Michal Marek<mmarek@suse.cz>:
>>>> Neither git archive not git rev-parse need the work tree, --git-dir=..
>>>> is sufficient.
>>>
>>> Are you sure?
>>
>> Yes.
>> $ cd /tmp
>> $ git --git-dir=$HOME/linux-2.6/.git rev-parse HEAD
>> e0a04b11e4059cab033469617c2a3ce2d8cab416
>>
>
> You are right about that command, but it doesn't use the source tree.

Yes, neither git rev-parse nor git archive use the work tree. That's 
what I tried to explain to you in my first mail.


> Do a git --git-dir=$HOME/linux-2.6/.git status from /tmp and see what
> happens.

That's irrelevant, I only talked about archive and rev-parse.


> So do you want me to send a new patch without --work-tree= in git rev-parse?

And in git archive.

Michal
