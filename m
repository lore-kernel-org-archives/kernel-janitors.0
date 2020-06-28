From: "Alim Akhtar" <alim.akhtar@samsung.com>
Date: Sun, 28 Jun 2020 01:56:44 +0000
Subject: RE: [PATCH] scsi: ufs: ufs-exynos: Remove an unnecessary NULL check
Message-Id: <041e01d64cef$5a166480$0e432d80$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20200626105156epcas5p191d18d66af6bd09a10635559461c0bc0@epcas5p1.samsung.com>
        <20200626105133.GF314359@mwanda>
        <041701d64ca7$70bafb80$5230f280$@samsung.com> <20200627175445.GG2571@kadam>
In-Reply-To: <20200627175445.GG2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: 'Avri Altman' <avri.altman@wdc.com>, "'James E.J. Bottomley'" <jejb@linux.ibm.com>, "'Martin K. Petersen'" <martin.petersen@oracle.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <krzk@kernel.org>, 'Kiwoong Kim' <kwmad.kim@samsung.com>, 'Wei Yongjun' <weiyongjun1@huawei.com>, linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> On Sat, Jun 27, 2020 at 10:51:44PM +0530, Alim Akhtar wrote:
> > Hi Dan
> >
> > > -----Original Message-----
> > > The "head" pointer can't be NULL because it points to an address in
the
> > middle
> > > of a ufs_hba struct.  Looking at this code, probably someone would
wonder
> > if
> > > the intent was to check whether "hba" is NULL, but "hba"
> > > isn't NULL and the check can just be removed.
> > >
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > Please add Fixes: tag
> > With that
> > Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> It's not a bug fix it's just a cleanup.
> 
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>

Thanks!

> regards,
> dan carpenter
