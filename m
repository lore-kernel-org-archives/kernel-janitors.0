From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 24 May 2007 15:53:53 +0000
Subject: Re: [KJ] old style C declaration
Message-Id: <9a8748490705240853j3eb127bw2d6e762c7fc656b4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <878xbeqmb3.fsf@wanadoo.fr>
In-Reply-To: <878xbeqmb3.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 24/05/07, Yoann Padioleau <padator@wanadoo.fr> wrote:
>
> Hi,
>
> In drivers/net/atari_pamsnet.c many (not all) functions use an old style:
>
> static HADDR
> *read_hw_addr(target, buffer)
>         int target;
>         unsigned char *buffer;
> {
>         HADDR *ret = 0;
>         unsigned char cmd_buffer[5];
>
>         if (send_first(target, READSECTOR))
>                 goto bad;
>         setup_dma(buffer, READ, 1);
>         cmd_buffer[0] = cmd_buffer[1] = cmd_buffer[2] = cmd_buffer[4] = 0;
>         cmd_buffer[3] = 1;
>         if (send_1_5(5, cmd_buffer, 1) ||
>             !acsi_wait_for_IRQ(TIMEOUTDMA) ||
>             get_status())
>                 goto bad;
>         ret = phys_to_virt((unsigned long)&(((DMAHWADDR *)buffer)->hwaddr));
>         dma_cache_maintenance((unsigned long)buffer, 512, 0);
> bad:
>         return (ret);
> }
>
>
> Can I change them so that the file use a consistent style ?
>
That would probably be a good idea, but the maintainer of the file has
the last word on that, but personally I'd just whip a patch together
and submit it to the maintainer and lkml...

> On the example this would lead to:
>
> static HADDR
> *read_hw_addr(int target, unsigned char * buffer)
> {
> ...
>
Not quite, if you want to follow kernel coding style it would lead to either

static HADDR
*read_hw_addr(int target, unsigned char *buffer)
{
...

or

static HADDR *read_hw_addr(int target, unsigned char *buffer)
{
...

Note the placement of the "*" before 'buffer'.   :-)

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
