From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Mon, 05 Jul 2010 20:52:06 +0000
Subject: Re: Keeping up to date with the upstream
Message-Id: <201007052252.07065.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278362590.5396.35.camel@dermezel>
In-Reply-To: <1278362590.5396.35.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Montag 05 Juli 2010 22:43:10 schrieb Joe Eloff:
> Hi
> 
> Just need clarification on this procedure:
> 
> What to do when git fetch origin tells you origin/master has diverged from
>  your local master and you are working on a branch making patches?
> 
> A link or search words will be fine will do reading myself.


Hi Joe,

quite often a simple 
git merge master
should do the job

git fetch + git merge = git pull
--> So you should perhaps try git pull instead.

However on trees that get rebased quite often (e.g. linux-next) the merge may 
fail.

With linux next I simply do something like
git fetch 
git reset --hard origin
on the master branch and not using any branches at all.

But this is only a good approach if you start working on a patch - otherwise 
you'd lose your changes.
But as a janitor you usually don't do large (multiple workday) patches so this 
might work for you too.
git fetch
git reset --hard origin
#start working
#when finished
git commit -a
git format-patch -s origin

--> Your (hopefully) ready to send patch is created.

Works fine for me, for janitorial tasks.

Thanks,
Peter




