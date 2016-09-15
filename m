From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Sep 2016 18:26:54 +0000
Subject: Re: [PATCH 6/7] AGPGART-UniNorth: Rename a jump label in uninorth_create_gatt_table()
Message-Id: <fea6c577-61f7-94bb-08f1-17cbfa671287@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201609160122.hY7g8HCC%fengguang.wu@intel.com>
In-Reply-To: <201609160122.hY7g8HCC%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

>    drivers/char/agp/uninorth-agp.c: In function 'uninorth_create_gatt_table':
>>> drivers/char/agp/uninorth-agp.c:426:3: error: label 'enomem' used but not defined
>       goto enomem;
>       ^
> 
> vim +/enomem +426 drivers/char/agp/uninorth-agp.c

This error message points a glitch out which was triggered by my update suggestion.
Unfortunately, it means that the proposed renaming of such an identifier was incomplete
at this source code place.

In which ways would you like to improve the shown software situation?

* Would you like to fix a single identifier anyhow directly?

* Do you expect that I should resend a corrected patch series as a whole package?

* Would it be sufficient to send another update only for the software module
  "AGPGART-UniNorth" a bit later?

* Can I worry about this programming mistake a bit less just because
  the suggested renaming would eventually be rejected?

Regards,
Markus
