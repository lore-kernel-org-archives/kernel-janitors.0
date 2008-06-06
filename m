From: "Felipe Balbi" <felipebalbi@users.sourceforge.net>
Date: Fri, 06 Jun 2008 18:08:43 +0000
Subject: Re: Full git history of Linux
Message-Id: <31e679430806061108h1b6de210ja8ef85cd315a88be@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <390282f40806060850v106f8defid2694dade6ba2135@mail.gmail.com>
In-Reply-To: <390282f40806060850v106f8defid2694dade6ba2135@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yoann padioleau <yoann.padioleau@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Fri, Jun 6, 2008 at 6:50 PM, yoann padioleau
<yoann.padioleau@gmail.com> wrote:
> Hi,
>
> If anyone is interested, I have put on my website[1] a git repository
> containing the full history of Linux, from 0.01 to now.
> It's built from 3 other git repositories:
>  - the one from Dave Jones from 0.01 to 2.4.0,
>  - the one from tglx from 2.4.0 to 2.6.12,
>  - the one from Linus Torvalds from 2.6.12 to now.
>
> I used the "graft" feature of git (thanks to Junio and people
> on #git for the tip) to link them together. I also modified
> (via a git-filter-branch) the dates of some commits as for
> instance all commits from the Dave Jones's repo had the
> same date (23 Nov 2007). For this I mainly used the timestamp info
> of files on kernel.org. The script and info I used are also
> available on my website[2].
>
> Note that because I used the graft feature, this repo is
> really just a superset of the one from Torvalds so you can
> pull as you would do with the Torvalds repo to get the
> latest Linux version.
>
> The reason why I built this repo is that I wanted to study
> the history of source code comments in Linux and git annotate
> could answer most of my questions automatically. For instance
> I wanted to know what comments were written before 1995 that are
> still present unmodified in the current Linux version.
> But for git annotate to work I needed a git repo with the
> full history of Linux. Other people may find my repo useful for other
> purpose.
>
> [1] full git repo:
>    http://aryx.kicks-ass.org/~pad/linux/full-history-linux.git.tar
>    Then untar it and do a git checkout -f  to populate it
>
>
> [2] script to build the git repo from scratch:
>    http://aryx.kicks-ass.org/~pad/linux/make-full-linux-history.tgz
>    Then untar it; make; ./make-full-kernel-history full
>    Note: you will need to install OCaml first.
>
> PS: Is there a way to put it on kernel.org?
>
> PS2: Some commits have only an approximate date. It was good
> enough for what I wanted. If you want more precise date, tell
> me, the script is easy to modify.

That's great :-)
I already got my copy and I'll try to use it to study linux evolution
over the years :-)

really good

-- 
Best Regards,

Felipe Balbi
felipebalbi@users.sourceforge.net
