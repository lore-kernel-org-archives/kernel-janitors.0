From: matt mooney <mfmooney@gmail.com>
Date: Fri, 13 May 2011 18:52:38 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
	<4DCC4365.3030907@suse.cz>
	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>
	<4DCC4F05.7010306@suse.cz>
	<BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
	<4DCCEB48.7030602@suse.cz>
In-Reply-To: <4DCCEB48.7030602@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 13, 2011 at 1:26 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 12.5.2011 23:38, matt mooney wrote:
>>
>> On Thu, May 12, 2011 at 2:20 PM, Michal Marek<mmarek@suse.cz> =A0wrote:
>>>
>>> On 12.5.2011 23:07, matt mooney wrote:
>>>>
>>>> 2011/5/12 Michal Marek<mmarek@suse.cz>:
>>>>>
>>>>> Neither git archive not git rev-parse need the work tree, --git-dir=
=3D..
>>>>> is sufficient.
>>>>
>>>> Are you sure?
>>>
>>> Yes.
>>> $ cd /tmp
>>> $ git --git-dir=3D$HOME/linux-2.6/.git rev-parse HEAD
>>> e0a04b11e4059cab033469617c2a3ce2d8cab416
>>>
>>
>> You are right about that command, but it doesn't use the source tree.
>
> Yes, neither git rev-parse nor git archive use the work tree. That's what=
 I
> tried to explain to you in my first mail.

Okay, again you are right; I erroneously thought git archive needed
the work tree too.

>> Do a git --git-dir=3D$HOME/linux-2.6/.git status from /tmp and see what
>> happens.
>
> That's irrelevant, I only talked about archive and rev-parse.
>
>
>> So do you want me to send a new patch without --work-tree=3D in git
>> rev-parse?
>
> And in git archive.

So the real problem is that tools/perf/MANIFEST contains wildcards,
and when git archive is run, file name expansion isn't working
properly. By adding the $(srctree) as a prefix, globbing works but
then git archive requires --work-tree to be set.

I really don't know of a better alternative.

Thanks,
matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
