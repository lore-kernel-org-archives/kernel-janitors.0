From: Rene Herman <rene.herman@gmail.com>
Date: Sat, 09 Jun 2007 12:51:23 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <466AA24B.4010406@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/09/2007 11:43 AM, psr wrote:

> How can i use git to make a clone of a local kernel src tree? e.g i want
> base repo to be my downloaded vanilla kernel 2.6.18.
> 
> How can i use git to make this as master, i clone the 2.6.18 src from my
> disk to my working directory , modify the kernel ,ass files etc and then
> merge with the 2.6.18 src base master which i downloaded.

That final step, "merge with the 2.6.18 src base master" is a bit backwards, 
but sure, you can use git in any local sense that you like. To turn your 
downloaded 2.6.18 kernel into a GIT repo:

$ cd ~/src
$ tar xzf ~/linux-2.6.18.tar.gz
$ mv linux-2.6.18 linux
$ cd linux
$ git init
$ git add .
$ git commit -a -m "initial commit"

You now have a fully functional GIT repository containing the 2.6.18 kernel. 
You can use it directly to do development in; just use branches:

$ git checkout -b local

and start hacking away -- the changes you make will happen on the "local" 
branch and after commiting those (git commit -a) you can switch back to the 
master branch at anytime with "git checkout master", after which you can 
create other branches:

$ git checkout -b work

or decide that local branch sucked after all:

$ git branch -D local

or merge in the work from your local branch into master:

$ git pull . local

or play tetris:

$ git tetris

If you really do want to "double buffer" things though as you're suggesting 
above, you can also after creating the repository first make a local clone 
of it:

$ cd ~/src
$ git clone -l -s linux local

after which you can use that "local" tree as the tree in which you do your 
hacking and branching. A simple "git pull" while in this local tree would 
update from its master which is the "linux" tree you created.

> I am facing trouble fixing this. All tutorials ask to pull from Linus's
> latest src tree which i dont need right now. Can i use it for the purpose
> i intend?

Yes. GIT's most profound problem seems to be that you can use for basically 
any purpose. Advice: don't try to pin down an entire workflow right from the 
start; just start using it, and learning what it can do as you go along, and 
more importantly, learning what you _want_ it to do as you go along.

Specifically, you're really best of ignoring all the stuff above about 
setting up that local repo and just clone the master linux repo. You need to 
do that only once and afterwards, you can just merrily update through simple 
"git pull" commands. So, I'd suggest:

$ cd ~/src
$ git clone -n 
git://git2.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git linus

I hope that wordwraps in non too awkward positions. It clones the master 
linux GIT repo into a local directory called "linus" and the -n makes it not 
checkout after the clone.

Yes, this is fetching lots of data and will certainly take a while if you're 
on a slow connection. As said, you only have to do it once though. Once it 
completes, you can (just in case) back up that initial repository clone 
simply with a "tar cf linus-20070609.tar linus" after which you can start 
from that point again for ever more.

Then, you can work directly in that repo using branches, or again double 
buffer by cloning it locally once more:

$ git clone -l -s linus local

and work in that tree. A "git pull"  from the "local" repository would 
update from the "linus" repository on your own disk, and a "git pull" from 
the "linus" repository would update from linus' repository at the above 
mentioned url.

Hope this was somewhat useful but as a PS -- this question was more for the 
kernelnewbies mailing list than the kernel janitors. Kernelnewbies seems to 
be dwindling a bit lately which seems a shame. I'm crossposting this there.

Subscription info at: http://kernelnewbies.org/MailingList

Let's keep it alive.

Rene.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
