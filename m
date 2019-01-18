From: James Morris <jmorris@namei.org>
Date: Fri, 18 Jan 2019 19:40:48 +0000
Subject: Re: [PATCH -next] LSM: Make some functions static
Message-Id: <alpine.LRH.2.21.1901190640280.581@namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547617472-60140-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547617472-60140-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 16 Jan 2019, Wei Yongjun wrote:

> Fixes the following sparse warnings:
> 
> security/security.c:533:5: warning:
>  symbol 'lsm_task_alloc' was not declared. Should it be static?
> security/security.c:554:5: warning:
>  symbol 'lsm_ipc_alloc' was not declared. Should it be static?
> security/security.c:575:5: warning:
>  symbol 'lsm_msg_msg_alloc' was not declared. Should it be static?
> 
> Fixes: f4ad8f2c4076 ("LSM: Infrastructure management of the task security")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/security.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Casey, please review these fixes for your patchset.

> diff --git a/security/security.c b/security/security.c
> index 9a98c52..750d3f3 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -530,7 +530,7 @@ int lsm_inode_alloc(struct inode *inode)
>   *
>   * Returns 0, or -ENOMEM if memory can't be allocated.
>   */
> -int lsm_task_alloc(struct task_struct *task)
> +static int lsm_task_alloc(struct task_struct *task)
>  {
>  	if (blob_sizes.lbs_task = 0) {
>  		task->security = NULL;
> @@ -551,7 +551,7 @@ int lsm_task_alloc(struct task_struct *task)
>   *
>   * Returns 0, or -ENOMEM if memory can't be allocated.
>   */
> -int lsm_ipc_alloc(struct kern_ipc_perm *kip)
> +static int lsm_ipc_alloc(struct kern_ipc_perm *kip)
>  {
>  	if (blob_sizes.lbs_ipc = 0) {
>  		kip->security = NULL;
> @@ -572,7 +572,7 @@ int lsm_ipc_alloc(struct kern_ipc_perm *kip)
>   *
>   * Returns 0, or -ENOMEM if memory can't be allocated.
>   */
> -int lsm_msg_msg_alloc(struct msg_msg *mp)
> +static int lsm_msg_msg_alloc(struct msg_msg *mp)
>  {
>  	if (blob_sizes.lbs_msg_msg = 0) {
>  		mp->security = NULL;
> 
> 
> 

-- 
James Morris
<jmorris@namei.org>
