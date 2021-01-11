From: Mimi Zohar <zohar@linux.ibm.com>
Date: Mon, 11 Jan 2021 13:46:40 +0000
Subject: Re: [PATCH v2] evm: Fix memory leak in init_desc
Message-Id: <31aed9f12482d1156c224c2cc5ac8afd81e8cb14.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210110080253.32345-1-dinghao.liu@zju.edu.cn>
         <7288d0ce-e900-d942-fb6b-eabb63649591@web.de>
In-Reply-To: <7288d0ce-e900-d942-fb6b-eabb63649591@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Dinghao Liu <dinghao.liu@zju.edu.cn>, Eric Biggers <ebiggers@kernel.org>, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@nokia.com>, James Morris <jmorris@namei.org>, Kangjie Lu <kjlu@umn.edu>, "Serge E. Hallyn" <serge@hallyn.com>

Hi Dinghao,

On Sun, 2021-01-10 at 11:50 +0100, Markus Elfring wrote:
> > When kmalloc() fails, tmp_tfm allocated by
> > crypto_alloc_shash() has not been freed, which
> > leads to memleak.

In the future, please conform to Documentation/process/submitting-
patches.rst: 

  - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.

> 
> Do any Linux developers care for the following aspects?
> 
> * Imperative wordings for change descriptions
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id/f90100ace886895e4fbb2850b8d5e49d931ed6#n89
> 
> * Usage of the term “memory leak” (instead of an abbreviation)

In general I agree, but this is a really small, obvious bug fix. 
Assuming Dinghao is fine with my updating the patch description, I'll
fix it.

Mimi
