From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Date: Tue, 21 Jul 2020 15:26:09 +0000
Subject: Re: [PATCH][next] x86/ioperm: initialize pointer bitmap with NULL rather than 0
Message-Id: <46011f9b-a5a6-b91c-f8c0-1c106ff5e60e@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200721100217.407975-1-colin.king@canonical.com>
In-Reply-To: <20200721100217.407975-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 21.07.20 12:02, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer bitmap is being initialized with a plain integer 0,
> fix this by initializing it with a NULL instead.
> 
> Cleans up sparse warning:
> arch/x86/xen/enlighten_pv.c:876:27: warning: Using plain integer
> as NULL pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
