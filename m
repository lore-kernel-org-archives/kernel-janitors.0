From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 05:01:02 +0000
Subject: Re: iommu: Improve exception handling in iommu_group_alloc()
Message-Id: <b31fbcd1-b5f8-992b-a994-2a950ab36b61@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
 <20200602015044.GA89266@VM20190228-100.tbsite.net>
In-Reply-To: <20200602015044.GA89266@VM20190228-100.tbsite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> * I suggest to avoid the specification of duplicate function calls.
>>   Will it be helpful to add a few jump targets?
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162#n455
>
> I don't think it is helpful or readable to add some jump targets here,
> since the exception handling is very simple here.

Do you disagree to the application of the Linux coding style then
for the recommended exception handling?

Regards,
Markus
