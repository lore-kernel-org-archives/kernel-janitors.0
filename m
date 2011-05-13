From: Michal Marek <mmarek@suse.cz>
Date: Fri, 13 May 2011 19:56:20 +0000
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
Message-Id: <4DCD8CE4.4090404@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>	<4DCC4365.3030907@suse.cz>	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>	<4DCC4F05.7010306@suse.cz>	<BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>	<4DCCEB48.7030602@suse.cz> <BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
In-Reply-To: <BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13.5.2011 20:52, matt mooney wrote:
> So the real problem is that tools/perf/MANIFEST contains wildcards,
> and when git archive is run, file name expansion isn't working
> properly. By adding the $(srctree) as a prefix, globbing works but
> then git archive requires --work-tree to be set.

I see. So how about
git --git-dir=$(srctree)/.git archive ... \
    $$(cd $(srctree); echo $$(cat tools/perf/MANIFEST))
? That does exactly the same as before the patch, just changes to
$(srctree) so that the expansion works.

Michal
