From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Tue, 28 Aug 2018 22:27:06 +0000
Subject: Re: [PATCH] x86/xen: remove redundant variable save_pud
Message-Id: <3057bad8-cea8-d72f-d83c-88e34c281d22@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180828161046.17165-1-colin.king@canonical.com>
In-Reply-To: <20180828161046.17165-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/28/2018 12:10 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable save_pud is being assigned but is never used hence it is
> redundant and can be removed.
>
> Cleans up clang warning:
> variable 'save_pud' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>



Applied to for-linus-19b.

-boris
