From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 28 Jul 2008 16:06:30 +0000
Subject: Re: [PATCH] fix warning in arch/x86/mm/pgtable.c
Message-Id: <20080728160630.GA17669@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217091007.6107.8.camel@inlin>
In-Reply-To: <1217091007.6107.8.camel@inlin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Michael Borisov <niro@tut.by>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, the arch/x86 maintainers <x86@kernel.org>


* Michael Borisov <niro@tut.by> wrote:

> This patch fixes the following compile warning:
> 
> arch/x86/mm/pgtable.c: In function ‘pgd_mop_up_pmds’:
> arch/x86/mm/pgtable.c:194: warning: unused variable ‘pmd’

> -               pmd_t *pmd = (pmd_t *)get_zeroed_page(GFP_KERNEL|
> __GFP_REPEAT);
> +               pmd_t *pmd;
> +               pmd = (pmd_t *)get_zeroed_page(GFP_KERNEL|__GFP_REPEAT);

what gcc version are you using? Seems to be a compiler bug.

	Ingo
