From: Greentime Hu <green.hu@gmail.com>
Date: Fri, 13 Jul 2018 06:03:52 +0000
Subject: Re: [bug report] nds32: Loadable modules
Message-Id: <CAEbi=3dpkEU2mb6vUj07QiitdWYO2y0+HEy56ZC-etBk_+685A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
In-Reply-To: <20180712124159.h7kqf2hamut2idhd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, July 12, 2018 8:42 PM
> To: Greentime Ying-Han Hu(胡英漢)
> Cc: Vincent Chen; kernel-janitors@vger.kernel.org
> Subject: [bug report] nds32: Loadable modules
>
> Hello Greentime Hu,
>
> The patch c9a4a8da6baa: "nds32: Loadable modules" from Oct 25, 2017,
> leads to the following static checker warning:
>
>         ./arch/nds32/kernel/module.c:43 do_reloc16()
>         warn: should this be a bitwise negate mask?
>
> ./arch/nds32/kernel/module.c
>     29  void do_reloc16(unsigned int val, unsigned int *loc, unsigned int val_mask,
>     30                  unsigned int val_shift, unsigned int loc_mask,
>     31                  unsigned int partial_in_place, unsigned int swap)
>     32  {
>     33          unsigned int tmp = 0, tmp2 = 0;
>     34
>     35          __asm__ __volatile__("\tlhi.bi\t%0, [%2], 0\n"
>     36                               "\tbeqz\t%3, 1f\n"
>     37                               "\twsbh\t%0, %1\n"
>     38                               "1:\n":"=r"(tmp):"0"(tmp), "r"(loc), "r"(swap)
>     39              );
>     40
>     41          tmp2 = tmp & loc_mask;
>     42          if (partial_in_place) {
>     43                  tmp &= (!loc_mask);
>                                 ^^^^^^^^^^
> It looks like this should maybe be ~loc_mask?
>
>     44                  tmp =
>     45                      tmp2 | ((tmp + ((val & val_mask) >> val_shift)) & val_mask);
>     46          } else {
>     47                  tmp = tmp2 | ((val & val_mask) >> val_shift);
>     48          }
>     49
>     50          __asm__ __volatile__("\tbeqz\t%3, 2f\n"
>     51                               "\twsbh\t%0, %1\n"
>     52                               "2:\n"
>     53                               "\tshi.bi\t%0, [%2], 0\n":"=r"(tmp):"0"(tmp),
>     54                               "r"(loc), "r"(swap)
>     55              );
>     56  }
>     57
>     58  void do_reloc32(unsigned int val, unsigned int *loc, unsigned int val_mask,
>     59                  unsigned int val_shift, unsigned int loc_mask,
>     60                  unsigned int partial_in_place, unsigned int swap)
>     61  {
>     62          unsigned int tmp = 0, tmp2 = 0;
>     63
>     64          __asm__ __volatile__("\tlmw.bi\t%0, [%2], %0, 0\n"
>     65                               "\tbeqz\t%3, 1f\n"
>     66                               "\twsbh\t%0, %1\n"
>     67                               "\trotri\t%0, %1, 16\n"
>     68                               "1:\n":"=r"(tmp):"0"(tmp), "r"(loc), "r"(swap)
>     69              );
>     70
>     71          tmp2 = tmp & loc_mask;
>     72          if (partial_in_place) {
>     73                  tmp &= (!loc_mask);
>                                 ^^^^^^^^^
> Same.

Hi Dan,

You are right. We should use ~loc_mask. Thank you for finding it.
Would you like to sent a patch for this or should I just create one
patch with your signed-off-by?
