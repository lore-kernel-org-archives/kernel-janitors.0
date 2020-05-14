From: Mimi Zohar <zohar@linux.ibm.com>
Date: Thu, 14 May 2020 18:21:50 +0000
Subject: Re: [PATCH v2] evm: Fix a small race in init_desc()
Message-Id: <1589480510.4757.5.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7743ab21a574eeeac40d783e0b8581c@huawei.com>
         <20200512174706.GA298379@mwanda>
         <a30fdceccef443b0a6ac8e0b06b83efc@huawei.com>
         <19452750e36d462088f4fca3d627a090@huawei.com>
In-Reply-To: <19452750e36d462088f4fca3d627a090@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@nokia.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, 2020-05-14 at 07:11 +0000, Krzysztof Struczynski wrote:
> > > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > > This patch avoids a kernel panic due to accessing an error pointer set
> > > by crypto_alloc_shash(). It occurs especially when there are many
> > > files that require an unsupported algorithm, as it would increase the
> > > likelihood of the following race condition.
> > >
> > > Imagine we have two threads and in the first thread
> > > crypto_alloc_shash() fails and returns an error pointer.
> > >
> > > 		*tfm = crypto_alloc_shash(algo, 0, CRYPTO_NOLOAD);
> > > 		if (IS_ERR(*tfm)) {
> > > 			rc = PTR_ERR(*tfm); <--- FIRST THREAD HERE!
> > > 			pr_err("Can not allocate %s (reason: %ld)\n", algo, rc);
> > > 			*tfm = NULL;
> > >
> > > And the second thread is here:
> > >
> > > 	if (*tfm = NULL) {  <--- SECOND THREAD HERE!
> > > 		mutex_lock(&mutex);
> > > 		if (*tfm)
> > > 			goto out;
> > >
> > > Since "*tfm" is non-NULL, we assume that it is valid and that leads to
> > > a crash when it dereferences "*tfm".
> > >
> > > 	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(*tfm),
> > >                                                              ^^^^
> > >
> > > This patch fixes the problem by introducing a temporary "tmp_tfm" and
> > > only setting "*tfm" at the very end after everything has succeeded.
> > > The other change is that I reversed the initial "if (!*tfm) {"
> > > condition and pull the code in one indent level.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: d46eb3699502b ("evm: crypto hash replaced by shash")
> > > Reported-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > Reported-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Acked-by: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Acked-by: Krzysztof Struczynski <krzysztof.struczynski@huawei.com>

Thanks, Roberto and Krzysztof.

This patch is now queued in the "fixes" branch.

Mimi
