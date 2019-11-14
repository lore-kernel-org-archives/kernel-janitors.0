From: "Gomonovych, Vasyl" <gomonovych@gmail.com>
Date: Thu, 14 Nov 2019 08:56:45 +0000
Subject: Re: scsi: pmcraid: Use *_pool_zalloc rather than *_pool_alloc
Message-Id: <CAHYXAn+hzzysj6uW6ghLDtjZ7UxEDXXzvLDW46VkJyVwBD78Lw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1559161113902-328168114-2-diffsplit-thomas@m3y3r.de> <07841ae4-03d2-1fdd-1c32-85c55688bb2a@web.de>
In-Reply-To: <07841ae4-03d2-1fdd-1c32-85c55688bb2a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Thomas Meyer <thomas@m3y3r.de>, "James E. J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

Yes, maybe you are right better to use the full name, sorry.

Regards Vasyl

On Sun, Nov 3, 2019 at 5:05 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Use *_pool_zalloc rather than *_pool_alloc followed by memset with 0.
>
> Do you find a commit message nicer from a similar change suggestion?
> scsi: pmcraid: Use dma_pool_zalloc rather than dma_pool_alloc
> https://lore.kernel.org/linux-scsi/20190718181051.22882-1-gomonovych@gmail.com/
> https://lore.kernel.org/patchwork/patch/1102040/
>
> Regards,
> Markus



-- 
Доброї вам пори дня.
