From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 08 Jun 2015 08:33:09 +0000
Subject: Re: [PATCH v2] ARM: pxa: ssp: remove unnessary free for devm_xxx
Message-Id: <alpine.DEB.2.10.1506081032060.2660@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433750803-26439-1-git-send-email-firogm@gmail.com>
 <alpine.DEB.2.10.1506081008570.2660@hadrien> <20150608081936.GA26627@firo>
 <alpine.DEB.2.10.1506081021170.2660@hadrien> <20150608082321.GB26627@firo>
In-Reply-To: <20150608082321.GB26627@firo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

> >Maybe you can put a comment under the --- explaining the situation.
>
> Sorry, --- stands for what?

In your patch you have a --- after the commit message and before the diff.
If you put some text under the --- and before the diff, the person who
reads the mail will see it, but it will not go into the git log.

julia
