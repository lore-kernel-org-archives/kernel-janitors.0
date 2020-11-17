From: Will Deacon <will@kernel.org>
Date: Tue, 17 Nov 2020 23:24:28 +0000
Subject: Re: [PATCH] iommu/vt-d: include conditionally on CONFIG_INTEL_IOMMU_SVM
Message-Id: <160565219047.2773717.5820442945194882017.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201115205951.20698-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201115205951.20698-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Liu Yi L <yi.l.liu@intel.com>, David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, catalin.marinas@arm.com, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>, kernel-team@android.com

On Sun, 15 Nov 2020 21:59:51 +0100, Lukas Bulwahn wrote:
> Commit 6ee1b77ba3ac ("iommu/vt-d: Add svm/sva invalidate function")
> introduced intel_iommu_sva_invalidate() when CONFIG_INTEL_IOMMU_SVM.
> This function uses the dedicated static variable inv_type_granu_table
> and functions to_vtd_granularity() and to_vtd_size().
> 
> These parts are unused when !CONFIG_INTEL_IOMMU_SVM, and hence,
> make CC=clang W=1 warns with an -Wunused-function warning.
> 
> [...]

Applied to arm64 (for-next/iommu/vt-d), thanks!

[1/1] iommu/vt-d: include conditionally on CONFIG_INTEL_IOMMU_SVM
      https://git.kernel.org/arm64/c/68dd9d89eaf5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
