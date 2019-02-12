From: Kees Cook <keescook@chromium.org>
Date: Tue, 12 Feb 2019 16:55:00 +0000
Subject: Re: [PATCH -next] LSM: fix return value check in safesetid_init_securityfs()
Message-Id: <CAGXu5jLRD49pbatrLPPOtJnGGFT+uT8Uz3OzVo-E0MgZg-NgxA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190212075831.114668-1-weiyongjun1@huawei.com>
In-Reply-To: <20190212075831.114668-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Micah Morton <mortonm@chromium.org>, linux-security-module <linux-security-module@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Feb 11, 2019 at 11:44 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function securityfs_create_dir() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Fixes: aeca4e2ca65c ("LSM: add SafeSetID module that gates setid calls")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Nice catch! Thanks,

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  security/safesetid/securityfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/safesetid/securityfs.c b/security/safesetid/securityfs.c
> index 61be4ee459cc..2c6c829be044 100644
> --- a/security/safesetid/securityfs.c
> +++ b/security/safesetid/securityfs.c
> @@ -167,7 +167,7 @@ static int __init safesetid_init_securityfs(void)
>                 return 0;
>
>         safesetid_policy_dir = securityfs_create_dir("safesetid", NULL);
> -       if (!safesetid_policy_dir) {
> +       if (IS_ERR(safesetid_policy_dir)) {
>                 ret = PTR_ERR(safesetid_policy_dir);
>                 goto error;
>         }
>
>
>


-- 
Kees Cook
