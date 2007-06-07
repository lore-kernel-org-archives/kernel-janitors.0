From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Thu, 07 Jun 2007 10:08:14 +0000
Subject: [KJ] Re: [PATCH]: complete cleanup of check_region
Message-Id: <9a8748490706070308m7c2212fq30fe712e26e2463b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181209169.2422.12.camel@bluegenie>
In-Reply-To: <1181209169.2422.12.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Surya <surya.prabhakar@wipro.com>
Cc: emoenke@gwdg.de, linux-kernel@vger.kernel.org, alan@lxorguk.ukuu.org.uk, kernel-janitors <kernel-janitors@lists.osdl.org>, trivial <trivial@kernel.org>, hannu@opensound.com

On 07/06/07, Surya <surya.prabhakar@wipro.com> wrote:
> Hi all,
>         This patch cleans up all the instances of check_region and
> __check_region and replaces them with request_region and
> __request_region. Applies and compiles clean on latest Linus tree.
>
> Files affected:
>         drivers/cdrom/sbpcd.c
>         drivers/pnp/resource.c
>         include/linux/ioport.h
>         kernel/resource.c
>         sound/oss/pss.c
>
>
> thanks.
>
>
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
> ---
>
> diff --git a/drivers/cdrom/sbpcd.c b/drivers/cdrom/sbpcd.c
> index a1283b1..2c1355e 100644
> --- a/drivers/cdrom/sbpcd.c
> +++ b/drivers/cdrom/sbpcd.c
> @@ -358,6 +358,11 @@
>   * Add bio/kdev_t changes for 2.5.x required to make it work again.
>   * Still room for improvement in the request handling here if anyone
>   * actually cares.  Bring your own chainsaw.    Paul G.  02/2002
> + *
> + *
> + * Cleaned up the reference for deprecated check_region to
> + * request_region.
> + * Thu Jun  7 12:14:00 IST 2007 Surya <surya.prabhakar@wipro.com>
>   */
>
>
> @@ -5670,7 +5675,7 @@ int __init sbpcd_init(void)
>         {
>                 addr[1]=sbpcd[port_index];
>                 if (addr[1]=0) break;
> -               if (check_region(addr[1],4))
> +               if (request_region(addr[1],4, "sbpcd driver"))

No!  You can't just swap one for the other.

check_region() simply checks if the region is available, it doesn't
reserve it (well, it does, briefly, but it lets it go again).
request_region() reserves the region. That's different behaviour that
you need to take into account.

Then there's the matter of return values. check_region() returns 0 on
success while request_region returns != 0 on success. I don't see your
patch dealing with that.

And finally, now that you request (and thus reserve) these regions,
where is the code to release them again when they are no longer
needed. just as memory allocated with kmalloc() needs to be freed with
kfree() after use, so regions reserved with request_region() need to
be released again with release_region() when they are no longer
needed. I don't see anything in your patch that releases the requested
regions.

Same comments for the rest of the patch.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
