From: Juergen Gross <jgross@suse.com>
Date: Fri, 05 Apr 2019 06:47:40 +0000
Subject: Re: [PATCH] xen: Prevent buffer overflow in privcmd ioctl
Message-Id: <768d31bc-431f-d7d8-6fc3-8ded51764ffe@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404151217.GA22334@kadam>
In-Reply-To: <20190404151217.GA22334@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>

On 04/04/2019 17:12, Dan Carpenter wrote:
> The "call" variable comes from the user in privcmd_ioctl_hypercall().
> It's an offset into the hypercall_page[] which has (PAGE_SIZE / 32)
> elements.  We need to put an upper bound on it to prevent an out of
> bounds access.
> 
> Fixes: 1246ae0bb992 ("xen: add variable hypercall caller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to xen/tip.git for-linus-5.1b


Juergen
