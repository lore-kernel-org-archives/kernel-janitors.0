From: matt mooney <mfmooney@gmail.com>
Date: Fri, 13 May 2011 23:26:23 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <BANLkTinGrUb-U_7TLbMiqacC2mywAbxJVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>
	<4DCC4365.3030907@suse.cz>
	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>
	<4DCC4F05.7010306@suse.cz>
	<BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>
	<4DCCEB48.7030602@suse.cz>
	<BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
	<4DCD8CE4.4090404@suse.cz>
In-Reply-To: <4DCD8CE4.4090404@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 13, 2011 at 12:56 PM, Michal Marek <mmarek@suse.cz> wrote:
> On 13.5.2011 20:52, matt mooney wrote:
>> So the real problem is that tools/perf/MANIFEST contains wildcards,
>> and when git archive is run, file name expansion isn't working
>> properly. By adding the $(srctree) as a prefix, globbing works but
>> then git archive requires --work-tree to be set.
>
> I see. So how about
> git --git-dir=3D$(srctree)/.git archive ... \
> =A0 =A0$$(cd $(srctree); echo $$(cat tools/perf/MANIFEST))
> ? That does exactly the same as before the patch, just changes to
> $(srctree) so that the expansion works.

Sure that works too! I guess it is less invasive than my original
change. I will fix that up and resend it.

-matt

--=20
GPG-Key: 9AFE00EA
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
