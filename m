From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Date: Mon, 27 Sep 2010 08:24:11 +0000
Subject: Re: [PATCH] kbuild: remove duplicate -I flag in addtree
Message-Id: <20100927082411.GD5785@cr0.nay.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285553472-924-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1285553472-924-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Sep 26, 2010 at 07:11:12PM -0700, matt mooney wrote:
>When O= is used, any -I flag given that is not an absolute path gets
>duplicated. The $(1) appended to the conditional clause covers the
>absolute case, but due to being outside of the conditional statement
>it gets added everytime.
>
>Signed-off-by: matt mooney <mfm@muteddisk.com>

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>

>---
> scripts/Kbuild.include |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
>diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>index ed2773e..08c74ed 100644
>--- a/scripts/Kbuild.include
>+++ b/scripts/Kbuild.include
>@@ -158,7 +158,7 @@ modbuiltin := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.modbuiltin obj
> # Prefix -I with $(srctree) if it is not an absolute path.
> # skip if -I has no parameter
> addtree = $(if $(patsubst -I%,%,$(1)), \
>-$(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1))
>+$(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1)),$(1)))
> 
> # Find all -I options and call addtree
> flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))


The original code also missed a comma, this patch fixes it.

Thanks!
