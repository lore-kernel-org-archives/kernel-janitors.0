From: matt mooney <mfmooney@gmail.com>
Date: Thu, 12 May 2011 21:38:16 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
	<4DCC4365.3030907@suse.cz>
	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>
	<4DCC4F05.7010306@suse.cz>
In-Reply-To: <4DCC4F05.7010306@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 12, 2011 at 2:20 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 12.5.2011 23:07, matt mooney wrote:
>> 2011/5/12 Michal Marek <mmarek@suse.cz>:
>>> On 12.5.2011 20:25, mfmooney@gmail.com wrote:
>>>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>>>> index 1b7eaea..a32dc2d 100644
>>>> --- a/scripts/package/Makefile
>>>> +++ b/scripts/package/Makefile
>>>> @@ -118,10 +118,14 @@ perf-tar=3Dperf-$(KERNELVERSION)
>>>>
>>>> =A0quiet_cmd_perf_tar =3D TAR
>>>> =A0 =A0 =A0 =A0cmd_perf_tar =3D \
>>>> -git archive --prefix=3D$(perf-tar)/ HEAD^{tree} =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 \
>>>> - =A0 =A0 $$(cat $(srctree)/tools/perf/MANIFEST) -o $(perf-tar).tar; =
=A0\
>>>> +git --git-dir=3D$(srctree)/.git --work-tree=3D$(srctree) =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0\
>>>
>>> Neither git archive not git rev-parse need the work tree, --git-dir=3D..
>>> is sufficient.
>>
>> Are you sure?
>
> Yes.
> $ cd /tmp
> $ git --git-dir=3D$HOME/linux-2.6/.git rev-parse HEAD
> e0a04b11e4059cab033469617c2a3ce2d8cab416
>

You are right about that command, but it doesn't use the source tree.
Do a git --git-dir=3D$HOME/linux-2.6/.git status from /tmp and see what
happens.

So do you want me to send a new patch without --work-tree=3D in git rev-par=
se?

-matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
