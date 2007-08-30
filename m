From: "Steve French" <smfrench@gmail.com>
Date: Thu, 30 Aug 2007 20:19:48 +0000
Subject: Re: Fw: [KJ][patch 2/3] CIFS SMB: use abs() from kernel.h where appropriate
Message-Id: <524f69650708301319l1c46e56braf38734b4746f24a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <OF120A49A9.A12BA37A-ON87257347.004EBCF7-86257347.004ECE3B@us.ibm.com>
In-Reply-To: <OF120A49A9.A12BA37A-ON87257347.004EBCF7-86257347.004ECE3B@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

Merged into cifs-2.6.git tree.

> From: Andre Haupt <andre@finow14.de>
> Signed-off-by: Andre Haupt <andre@finow14.de>
> ---
> Index: linus/fs/cifs/cifssmb.c
> =================================> --- linus.orig/fs/cifs/cifssmb.c                 2007-08-30
> 11:43:20.000000000 +0200
> +++ linus/fs/cifs/cifssmb.c              2007-08-30 11:44:58.000000000
> +0200
> @@ -513,7 +513,7 @@ CIFSSMBNegotiate(unsigned int xid, struc
>  (int)ts.tv_sec, (int)utc.tv_sec,
>  (int)(utc.tv_sec - ts.tv_sec)));
>                                                  val = (int)(utc.tv_sec -
> ts.tv_sec);
> -                                                seconds = val < 0 ? -val
> : val;
> +                                                seconds = abs(val);
>                                                  result = (seconds /
> MIN_TZ_ADJ) * MIN_TZ_ADJ;
>                                                  remain = seconds %
> MIN_TZ_ADJ;
>                                                  if (remain >= (MIN_TZ_ADJ
> / 2))
>
> --
>
>


-- 
Thanks,

Steve
