From: Paul Moore <paul@paul-moore.com>
Date: Wed, 19 Aug 2020 13:17:13 +0000
Subject: Re: [PATCH][next] selinux: fix allocation failure check on newpolicy->sidtab
Message-Id: <CAHC9VhS3wvL43t+J=nhXiMj+1L+Ayso7+mO0z0KEM5uSfyM0mQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819104256.51499-1-colin.king@canonical.com>
In-Reply-To: <20200819104256.51499-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 19, 2020 at 6:42 AM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The allocation check of newpolicy->sidtab is null checking if
> newpolicy is null and not newpolicy->sidtab. Fix this.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/selinux/ss/services.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks Colin, merged into selinux/next.

-- 
paul moore
www.paul-moore.com
