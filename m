From: Marcelo Tosatti <mtosatti@redhat.com>
Date: Mon, 01 Nov 2010 17:19:49 +0000
Subject: Re: [PATCH] powerpc: kvm: fix information leak to userland
Message-Id: <20101101171949.GB4484@amt.cnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288429464-21763-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288429464-21763-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Alexander Graf <agraf@suse.de>, Avi Kivity <avi@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2010 at 01:04:24PM +0400, Vasiliy Kulikov wrote:
> Structure kvm_ppc_pvinfo is copied to userland with flags and
> pad fields unitialized.  It leads to leaking of contents of
> kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  I cannot compile this driver, so it is not tested at all.
> 
>  arch/powerpc/kvm/powerpc.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

