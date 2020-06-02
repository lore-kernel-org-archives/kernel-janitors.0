From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 07:06:12 +0000
Subject: Re: iommu: Improve exception handling in iommu_group_alloc()
Message-Id: <44b4a048-ef36-f75b-5869-22e5fe4b15d2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
 <20200602015044.GA89266@VM20190228-100.tbsite.net>
 <b31fbcd1-b5f8-992b-a994-2a950ab36b61@web.de>
 <20200602055639.GB89266@VM20190228-100.tbsite.net>
In-Reply-To: <20200602055639.GB89266@VM20190228-100.tbsite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> Do you disagree to the application of the Linux coding style then
>> for the recommended exception handling?
>
> No, that's not what I mean. My point is the exception handling in this
> patch is simple and no need to add 'goto' statement which does not help
> to improve readability.

Do we come along different programming imaginations?


> And I agree it is helpful for the cases where a function exits from multiple locations
> and more same cleanup work need to do.

Can this view fit also to calls of the function “kobject_put”?
https://lore.kernel.org/patchwork/patch/1251326/
https://lore.kernel.org/linux-iommu/8bfd018ef4add083a35a6a94a8da045cf3af51b6.1591063271.git.baolin.wang@linux.alibaba.com/
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/iommu.c?id=7cc31613734c4870ae32f5265d576ef296621343#n478
https://elixir.bootlin.com/linux/v5.7/source/drivers/iommu/iommu.c#L478

Regards,
Markus
