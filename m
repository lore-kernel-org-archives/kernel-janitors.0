From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 03 May 2020 21:10:01 +0000
Subject: question about lists
Message-Id: <alpine.DEB.2.21.2005032308500.2533@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

I was wondering what is the point of code like the following:

        INIT_LIST_HEAD(&bb->list);
        list_add(&bb->list, &s->workload->shadow_bb);

As far as I can see, list_add will initialize both fields of the list_head
structure without looking at their values, so why is the INIT_LIST_HEAD
needed?

thanks,
julia
