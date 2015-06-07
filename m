From: Firo Yang <firogm@gmail.com>
Date: Sun, 07 Jun 2015 13:42:11 +0000
Subject: Re: [PATCH] fib_trie: Fix potential null pointer dereference
Message-Id: <20150607134211.GA16700@firo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433590553-4672-1-git-send-email-firogm@gmail.com>
 <1433592304.1895.73.camel@edumazet-glaptop2.roam.corp.google.com>
 <20150607060129.GA9265@firo>
 <alpine.DEB.2.02.1506070835310.2108@localhost6.localdomain6>
 <20150607131924.GA16087@firo>
 <alpine.DEB.2.10.1506071520410.2716@hadrien>
In-Reply-To: <alpine.DEB.2.10.1506071520410.2716@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, davem@davemloft.net, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jun 07, 2015 at 03:23:57PM +0200, Julia Lawall wrote:
>> >I think that many people would make the same mistake when looking at the
>> >code.  The change doesn't seem to hurt anything?
>> Actually, yes. But it does imporve nothing but coding style.
>> I think Alexander's code style make function more compact is also a
>> good code style. So, just keep it original.
>
>Still it makes noise when other people look at the code and find that it
>looks odd.  Removing the false positive in smatch won't completely help,
>because people could look at the code for other reasons.

You said it! I will do the improvement.

Firo

>
>But, as you like.
>
>julia

-- 
