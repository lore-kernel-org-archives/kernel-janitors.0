From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Tue, 29 May 2007 16:20:03 +0000
Subject: Re: [KJ] why does struct inodes_stat_t include "int dummy[5]"?
Message-Id: <39e6f6c70705290920t23ff5d0fse2f4d6f4a8625f8e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705291154450.31066@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/29/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   from include/linux/fs.h:
>
> struct inodes_stat_t {
>         int nr_inodes;
>         int nr_unused;
>         int dummy[5];    <---- ?????????
> };
>
>   does that array actually have a purpose?

Generally these can be considered as padding, to make sure that the
struct uses 7 * sizeof(int), sometimes this is due to ABI
requirements.

Have you checked if this is not used at all? Or if instances of this
struct aren't casted to something else that uses this area for some
purpose?

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
