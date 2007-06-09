From: Rene Herman <rene.herman@gmail.com>
Date: Sat, 09 Jun 2007 13:01:10 +0000
Subject: Re: [KJ] [HOWTO]using git to make a local clone?
Message-Id: <466AA496.6090908@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
In-Reply-To: <a901b49a0706090243s275d1f62o6bfd751c3c1fcdab@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/09/2007 02:51 PM, Rene Herman wrote:

> Specifically, you're really best of ignoring all the stuff above about 
> setting up that local repo and just clone the master linux repo. You 
> need to do that only once and afterwards, you can just merrily update 
> through simple "git pull" commands. So, I'd suggest:
> 
> $ cd ~/src
> $ git clone -n 
> git://git2.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git linus

Just saw you posting proxy information -- the only thing that should change 
is replacing this GIT url with:

http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Rene.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
