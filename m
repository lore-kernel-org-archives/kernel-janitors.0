From: Ingo Molnar <mingo@elte.hu>
Date: Tue, 10 Jun 2008 10:18:43 +0000
Subject: Re: [PATCH] : Fix unused variable 'loops' warning in
Message-Id: <20080610101843.GN27706@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30806050644o216c798pbe88d269a63f64f2@mail.gmail.com>
In-Reply-To: <ea11fea30806050644o216c798pbe88d269a63f64f2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>


* Manish Katiyar <mkatiyar@gmail.com> wrote:

> Following patch fixes the below warning message :
> arch/x86/boot/a20.c:118: warning: unused variable 'loops'

applied to tip/x86/urgent, thanks Manish.

	Ingo
