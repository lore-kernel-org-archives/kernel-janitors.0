From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 03 Mar 2015 13:14:28 +0000
Subject: Re: [PATCH 1/1] iommu/vt-d: Convert non-returned local variable to boolean when relevant
Message-Id: <20150303131428.GB10502@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150206095953.GA5780@sloth>
In-Reply-To: <20150206095953.GA5780@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org

On Fri, Feb 06, 2015 at 10:59:53AM +0100, Quentin Lambert wrote:
>  drivers/iommu/intel-iommu.c         | 13 +++++++------
>  drivers/iommu/intel_irq_remapping.c | 12 ++++++------
>  2 files changed, 13 insertions(+), 12 deletions(-)

Applied, thanks.

