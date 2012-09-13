From: "Kasatkin, Dmitry" <dmitry.kasatkin@intel.com>
Date: Thu, 13 Sep 2012 14:49:54 +0000
Subject: Re: [digsig:working 47/64] security/integrity/digsig.c:74:1: warning: 'shash_digest' uses dynamic st
Message-Id: <CALLzPKY-nOeSnWtLOsgDRZqocsiiVgCFqXEoH1z5G5vSH4DKAQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120913144807.GA2562@localhost>
In-Reply-To: <20120913144807.GA2562@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

This is acceptable case for crypto stuff....

- Dmitry


On Thu, Sep 13, 2012 at 5:48 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Dmitry,
>
> I'm not sure if the warned 'dynamic stack allocation' is relevant, but
> as an FYI:
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/kasatkin/linux-digsig.git working
> head:   ca88a6aa648a167b6f8e5666518249635510b0b0
> commit: c6a28f9ee92fe96c5a7c4e5989eb7ae06b545469 [47/64] integrity: added digest calculation function
> config: s390-allyesconfig
>
> All error/warnings:
>
> security/integrity/digsig.c: In function 'shash_digest':
> security/integrity/digsig.c:74:1: warning: 'shash_digest' uses dynamic stack allocation [enabled by default]
>
> vim +74 security/integrity/digsig.c
>     64                  char ctx[crypto_shash_descsize(tfm)];
>     65          } desc;
>     66
>     67          desc.shash.tfm = tfm;
>     68          desc.shash.flags = 0;
>     69
>     70          rc = crypto_shash_digest(&desc.shash, data, len, digest);
>     71          if (!rc)
>     72                  rc = crypto_shash_digestsize(tfm);
>     73          return rc;
>   > 74  }
>     75
>     76  /**
>     77   * integrity_calc_digest() - digest calculation
>     78   * @algo:       digest algo id (enum digest_algo)
>     79   * @data:       data
>     80   * @len:        length of the data
>     81   * @digest:     digest
>     82   * @return:     digest length on success, -EINVAL otherwise
>     83   *
>     84   * Calculates digest of the data.
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
