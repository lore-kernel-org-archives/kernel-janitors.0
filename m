From: James Morris <jmorris@namei.org>
Date: Fri, 18 Jan 2019 19:47:15 +0000
Subject: Re: [PATCH -next] LSM: Make some functions static
Message-Id: <alpine.LRH.2.21.1901190647060.581@namei.org>
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

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general

-- 
James Morris
<jmorris@namei.org>
