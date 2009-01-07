From: Ingo Molnar <mingo@elte.hu>
Date: Wed, 07 Jan 2009 11:24:10 +0000
Subject: Re: [PATCH] x86: fix section mismatch warnings in
Message-Id: <20090107112410.GB30522@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200901062358.29954.lpotenza@inwind.it>
In-Reply-To: <200901062358.29954.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <lpotenza@inwind.it>
Cc: kernel-janitors@vger.kernel.org, mingo@redhat.com, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>


* Leonardo Potenza <lpotenza@inwind.it> wrote:

> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> The function local_allocate_threshold_blocks() has been marked 
> __cpuinit, in order to remove the following section mismatch messages:

applied to tip/x86/urgent, thanks Leonardo!

	Ingo
