From: "Dan Carpenter" <error27@gmail.com>
Date: Mon, 23 Oct 2006 18:32:08 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <a63d67fe0610231132y3be74a77ha91a078f2b03bf62@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	 <a63d67fe0610231101v2f407e7dv46adaf8dbb0fb4e@mail.gmail.com>
	 <20061023181329.GC23714@hmsreliant.homelinux.net>
In-Reply-To: <20061023181329.GC23714@hmsreliant.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Horman <nhorman@tuxdriver.com>
Cc: kernel-janitors@lists.osdl.org, akpm@osdl.org, maxk@qualcomm.com, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kjhall@us.ibm.com

On 10/23/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> On Mon, Oct 23, 2006 at 11:01:36AM -0700, Dan Carpenter wrote:
> > On 10/23/06, Neil Horman <nhorman@tuxdriver.com> wrote:
> > >+out3:
> > >+       for_each_online_node(node) {
> > >+               if(timers[node] != NULL)
> > >+                       kfree(timers[node]);
> > >+       }
> >
> > Tharindu is going to be unhappy out if he sees that.  There is a
> > possibility that timers[node] is uninitialized.  if node[0] is null
> > then node[1] is uninitialized and it's going to cause a crash.
> >
> > regards,
> > dan carpenter
>
>
> Theres a memset to ensure that all the timer pointers are initalized to NULL in
> the patch:
>
> @@ -709,16 +710,18 @@ static int __init mmtimer_init(void)
>         if (timers = NULL) {
>                 printk(KERN_ERR "%s: failed to allocate memory for device\n",
>                                 MMTIMER_NAME);
> -               return -1;
> +               goto out2;
>         }
>
> +       memset(timers,0,(sizeof(mmtimer_t *)*maxn));
> +
>
>

Ah.  Great.  Sorry, didn't notice that you'd taken care of that
already.  Looks good.

regards,
dan carpenter

> --
> /***************************************************
>  *Neil Horman
>  *Software Engineer
>  *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
>  ***************************************************/
>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
