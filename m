From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 07 Dec 2016 21:08:14 +0000
Subject: Re: [patch] ser_gigaset: return -ENOMEM on error instead of success
Message-Id: <1481144894.11167.7.camel@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161207112203.GC5507@elgon.mountain>
         <1481137583.12596.19.camel@tiscali.nl>
         <d8eb1f69-e68e-7792-00de-b14e6bac1606@imap.cc>
In-Reply-To: <d8eb1f69-e68e-7792-00de-b14e6bac1606@imap.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tilman Schmidt <tilman@imap.cc>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Tilman,

On Wed, 2016-12-07 at 21:57 +0100, Tilman Schmidt wrote:
> Not much of a mess, I reckon. Everything that has been allocated and
> registered up to that point is properly deallocated and unregistered.
> The code just fails to tell the kernel that module initialization has
> failed, so the module remains loaded even though it can never be
> called because it isn't hooked anywhere. That's a nuisance and a
> waste of RAM, but not much more.

Yes.

But then the removal of the module, which is the only reasonable thing to do
after all this has happened, seems to trigger a WARN in driver_unregister().
And it's that WARN that I think requires the entire stable song and dance.

Otherwise it would be, as far as I can tell, a hard to hit problem in an
obscure driver without any side effects.


Paul Bolle
