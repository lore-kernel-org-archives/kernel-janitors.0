From: James Morris <jmorris@namei.org>
Date: Tue, 12 Feb 2019 19:01:41 +0000
Subject: Re: [PATCH -next] LSM: fix return value check in safesetid_init_securityfs()
Message-Id: <alpine.LRH.2.21.1902130601300.15293@namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190212075831.114668-1-weiyongjun1@huawei.com>
In-Reply-To: <20190212075831.114668-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Micah Morton <mortonm@chromium.org>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 12 Feb 2019, Wei Yongjun wrote:

> In case of error, the function securityfs_create_dir() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: aeca4e2ca65c ("LSM: add SafeSetID module that gates setid calls")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next-general

-- 
James Morris
<jmorris@namei.org>
