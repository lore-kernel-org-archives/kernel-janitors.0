From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Sep 2019 14:48:54 +0000
Subject: Re: genetlink: prevent memory leak in netlbl_unlabel_defconf
Message-Id: <CAHC9VhRk8Gc_Yexrjz5uif+Vj7d+b=uMUytbrmbm2Yv+zoM05w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHC9VhR+4pZObDz7kG+rxnox2ph4z_wpZdyOL=WmdnRvdQNH9A@mail.gmail.com>
 <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
In-Reply-To: <c490685a-c7d6-5c95-5bf4-ed71f3c60cb6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen A McCamant <smccaman@umn.edu>, "David S. Miller" <davem@davemloft.net>

On Fri, Sep 27, 2019 at 9:15 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > > In netlbl_unlabel_defconf if netlbl_domhsh_add_default fails the
> > > allocated entry should be released.
> …
> > That said, netlbl_unlabel_defconf() *should* clean up here just on
> > principal if nothing else.
>
> How do you think about to add the tag “Fixes” then?

From what I've seen the "Fixes" tag is typically used by people who
are backporting patches, e.g. the -stable folks, to help decide what
they need to backport.  As I mentioned in my previous email this
missing free doesn't actually manifest itself as a practical leak on
any of the existing kernels so there isn't a need to backport this
patch.  For that reason I would probably skip the "Fixes" metadata
here, but I don't feel strongly enough about it to object if others
want it.  FWIW, I play things very conservatively when talking about
backporting patches to stable kernels; if it doesn't fix a serious
user-visible bug it shouldn't be backported IMHO.

This patch is more of a conceptual fix than a practical fix.  Not that
there is anything wrong with this patch, I just think it isn't as
critical as most people would think from reading "memory leak" in the
subject line.  Yes, there is a memory leak, but the kernel panics soon
after so it's a bit moot.  Further, even if the panic was somehow
skipped (?) the memory leak only happens once during boot; the failed
initialization is undoubtedly going to be far more damaging to the
system than a few lost bytes of memory.

-- 
paul moore
www.paul-moore.com
