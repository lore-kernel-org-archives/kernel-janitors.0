From: Ingo Molnar <mingo@kernel.org>
Date: Tue, 31 Jul 2018 05:56:01 +0000
Subject: Re: [PATCH] x86/uv: remove redundant check of p == q
Message-Id: <20180731055601.GA18964@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180730103117.13731-1-colin.king@canonical.com>
In-Reply-To: <20180730103117.13731-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


* Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for p = q is dead code because the proceeding switch
> statements jump to the end of the outer for-loop with continue
> statements.  Remove the dead code.
> 
> Detected by CoverityScan, CID#145071 ("Structureally dead code")

Do they really spell it "structureally", or is that your typo?

Also, pease Cc: x86 patches to lkml.

Thanks,

	Ingo
