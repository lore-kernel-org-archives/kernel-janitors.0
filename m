From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 04 May 2020 19:41:21 +0000
Subject: Re: question about lists
Message-Id: <07ecfa7c-897b-5bea-e84b-f0626f019842@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
In-Reply-To: <alpine.DEB.2.21.2005032308500.2533@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Le 03/05/2020 à 23:10, Julia Lawall a écrit :
> Hello,
>
> I was wondering what is the point of code like the following:
>
>          INIT_LIST_HEAD(&bb->list);
>          list_add(&bb->list, &s->workload->shadow_bb);
>
> As far as I can see, list_add will initialize both fields of the list_head
> structure without looking at their values, so why is the INIT_LIST_HEAD
> needed?
>
> thanks,
> julia
>
Hi,

I agree with you. I don't see the need of 'INIT_LIST_HEAD' here.

The only reasons I could see are:
    - initializing an "object" looks a safe thing to do before using it, 
even if useless.
    - in your example, before commit f52c380a48f52, it was allocated 
with kmalloc, so it was maybe to avoid a really unlikely 
'__list_add_valid' failure. Now that it is kzalloc'ed, this can not 
happen anymore.

Just my 2c.

CJ
