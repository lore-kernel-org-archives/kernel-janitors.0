From: Mimi Zohar <zohar@linux.ibm.com>
Date: Sun, 22 Jul 2018 23:38:41 +0000
Subject: Re: [PATCH -next] EVM: fix return value check in evm_write_xattrs()
Message-Id: <1532302721.6206.24.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531315720-4191-1-git-send-email-weiyongjun1@huawei.com>
         <20180711151510.GA23645@mail.hallyn.com>
In-Reply-To: <20180711151510.GA23645@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Serge E. Hallyn" <serge@hallyn.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, James Morris <jmorris@namei.org>, Matthew Garrett <mjg59@google.com>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2018-07-11 at 10:15 -0500, Serge E. Hallyn wrote:
> Quoting Wei Yongjun (weiyongjun1@huawei.com):
> > In case of error, the function audit_log_start() returns NULL pointer
> > not ERR_PTR(). The IS_ERR() test in the return value check should be
> > replaced with NULL test.
> > 
> > Fixes: fa516b66a1bf ("EVM: Allow runtime modification of the set of verified xattrs")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Acked-by: Serge Hallyn <serge@hallyn.com>

Thanks, this patch is now queued in the next-integrity branch of the
linux-integrity tree.

Mimi

