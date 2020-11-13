From: Paul Moore <paul@paul-moore.com>
Date: Fri, 13 Nov 2020 14:41:01 +0000
Subject: Re: [bug report] netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
Message-Id: <CAHC9VhQHas2FGcheAaizAHA65pfxa+oz5B88AP9WO4-hPF4kFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113085255.GA91999@mwanda>
In-Reply-To: <20201113085255.GA91999@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 13, 2020 at 3:53 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Paul Moore,
>
> The patch 866358ec331f: "netlabel: fix our progress tracking in
> netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
> static checker warning:
>
>         net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
>         error: uninitialized symbol 'iter_chain'.

Thanks Dan, I'll look at it today.  I'm a little confused as to why
the compiler didn't flag that, but perhaps I just missed it.  Anyway,
patch later today ...

-- 
paul moore
www.paul-moore.com
