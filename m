From: "vignesh babu" <vigneshbabu@gmail.com>
Date: Sun, 26 Aug 2007 12:54:20 +0000
Subject: Re: possible power-of-2 cleanup
Message-Id: <3d1754a30708260542s4d5084efw35fba9f4faa1ae5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0708260714110.24759@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert,
  Im on it...I have submitted a few more patches in the past week or
so and a few were accepted...will update on the wiki soon.
Vignesh


On 8/26/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   is anyone still working on the power-of-2 stuff?  surely, there's a
> cleaner way to code this from fs/namespace.c:
>
>
>         /*
>          * Find the power-of-two list-heads that can fit into the allocation..
>          * We don't guarantee that "sizeof(struct list_head)" is necessarily
>          * a power-of-two.
>          */
>         nr_hash = PAGE_SIZE / sizeof(struct list_head);
>         hash_bits = 0;
>         do {
>                 hash_bits++;
>         } while ((nr_hash >> hash_bits) != 0);
>         hash_bits--;
>
>         /*
>          * Re-calculate the actual number of entries and the mask
>          * from the number of bits we can fit.
>          */
>         nr_hash = 1UL << hash_bits;
>         hash_mask = nr_hash - 1;
>
>
> rday
>
> --
> ====================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://crashcourse.ca
> ====================================
> -
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 

----------------------------------------------
"Why is it that every time I'm with you, makes me believe in magic?"
