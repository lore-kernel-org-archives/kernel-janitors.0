From: Juergen Gross <jgross@suse.com>
Date: Wed, 19 Sep 2018 10:47:06 +0000
Subject: Re: [PATCH] x86/paravirt: fix some warning messages
Message-Id: <4d2ee859-12de-df78-0a50-2dc8e6c1e77d@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180919103553.GD9238@mwanda>
In-Reply-To: <20180919103553.GD9238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Alok Kataria <akataria@vmware.com>, Thomas Gleixner <tglx@linutronix.de>

On 19/09/18 12:35, Dan Carpenter wrote:
> The first argument to WARN_ONCE() is a condition.
> 
> Fixes: 5800dc5c19f3 ("x86/paravirt: Fix spectre-v2 mitigations for paravirt guests")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
