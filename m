From: Jinpu Wang <jinpu.wang@profitbricks.com>
Date: Thu, 23 Mar 2017 09:16:02 +0000
Subject: Re: [PATCH] scsi: pm8001: build in relevant functions and code on PM8001_USE_MSIX
Message-Id: <CAMGffEkffcSd961qC7OGubVQ2nYpv1ViGr4e6+ZxXg9diqfO3A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170322185004.1012-1-colin.king@canonical.com>
In-Reply-To: <20170322185004.1012-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: lindar_liu <lindar_liu@usish.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, pmchba@pmcs.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 22, 2017 at 7:50 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the misx and intx variables of the interrupt enable/disable
> helper functions are built in no matter what the setting of the
> macro PM8001_USE_MSIX.  Clean this up by just building in the
> necessary helper functions and calls to these functions depending on
> the setting of PM8001_USE_MSIX.  This addresses several dead code
> paths found by static analysis with CoverityScan.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/pm8001/pm8001_hwi.c | 63 +++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 30 deletions(-)

Thanks Colin,

Mind to also change pm80xx_hw.c?

-- 
Jack Wang
Linux Kernel Developer

ProfitBricks GmbH
Greifswalder Str. 207
D - 10405 Berlin

Tel:       +49 30 577 008  042
Fax:      +49 30 577 008 299
Email:    jinpu.wang@profitbricks.com
URL:      https://www.profitbricks.de

Sitz der Gesellschaft: Berlin
Registergericht: Amtsgericht Charlottenburg, HRB 125506 B
Geschäftsführer: Achim Weiss
